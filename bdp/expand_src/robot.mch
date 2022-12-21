/* robot
 * Author: Pasan
 * Creation date: 11/19/2022
 */
MACHINE
    robot

    SETS
        DIRECTIONS = { north , south , east , west } ;
        REPORT = { OPERATION_SUCCESSFUL , ERROR_internal_wall_detected , ERROR_maze_wall_detected , ERROR_attempt_to_move_out_of_maze , YES , NO }

    CONCRETE_CONSTANTS
        // Maze Constants
        mazeXSize , mazeYSize , fullMaze , internalWalls , emptyMazeSquares , entranceSquare , exitSquare

    PROPERTIES
        mazeXSize <: NAT1 &
        mazeXSize = 1 .. 7 &
        mazeYSize <: NAT1 &
        mazeYSize = 1 .. 5 &

        // Maze Properties
        // The full maze is made up by the Cartesian product of the mazeXSize and mazeYSize.
        fullMaze = mazeXSize * mazeYSize &

        /*
            These are blocks of walls which is placed in the grid in  order to make the grid a maze.
            The coordinated of the internal walls should be belong to the coordinates of the full maze structure which is take as the fullMaze
        */
        internalWalls <: fullMaze &
        internalWalls = { 1 |-> 3 , 2 |-> 1 , 2 |-> 3 , 2 |-> 5 , 3 |-> 3 , 4 |-> 2 , 4 |-> 3 , 4 |-> 4 , 6 |-> 1 , 6 |-> 2 , 6 |-> 4 , 7 |-> 4 } &

         /* 
             Empty maze squares are the squares through which a robot can move through a maze.
             These should also belong to the coordinates of the full maze structure.
         */
        emptyMazeSquares <: fullMaze &

        // In the fullMaze there can't be any squares which is an empty square as well an an internal wall.
        emptyMazeSquares /\ internalWalls = {} &

        // All squares should EITHER be EMPTY or OCCUPIED BY A WALL and the union of these 2 should be equal to the full maze structurew
        emptyMazeSquares \/ internalWalls = fullMaze &

        entranceSquare : emptyMazeSquares &
        entranceSquare = 1 |-> 1 &

        exitSquare = 1 |-> 5 &
        exitSquare : emptyMazeSquares

    DEFINITIONS
        isEmptyMazeSquare ( x , y ) == ( x |-> y : emptyMazeSquares ) ;
        isOutOfMaze ( x , y ) == ( x |-> y /: fullMaze ) ;




        ANIMATION_FUNCTION == ( { row , column , image | row : mazeYSize & column : mazeXSize &


                ( IF ( { column |-> 6 - row } <: internalWalls ) // The reason why we have 6-r is because
                                                            // ProB draws the diagram from Top to Bottom unlike the
                                                            // coordinate system given in the spec where it goes from Bottom to Top
                    THEN
                        // Internal wall square image
                        image = 1
                    ELSE
                        IF ( column = robotX & row = ( 6 - robotY ) ) // If this the column and row the robot is currently occupying
                                                                  // (same as entry square at the beginning of the animation)
                        THEN
                            // Robot image
                            image = 2
                        ELSE
                            // Empty maze square image
                            image = 0
                        END
                    END ) } ) ;



        ANIMATION_IMG0 == "images/sm_empty_box.gif" ;
        ANIMATION_IMG1 == "images/sm_gray_box.gif" ;
        ANIMATION_IMG2 == "images/sm_knight_white.gif" ;

    ABSTRACT_VARIABLES
        robotX , robotY , visitedCells , robotMovement , currentCell , movingDirection

    INVARIANT
        robotX : mazeXSize & robotY : mazeYSize & movingDirection : DIRECTIONS &
        robotMovement : seq ( DIRECTIONS ) & currentCell : fullMaze &
        visitedCells : seq ( emptyMazeSquares )

    INITIALISATION
        robotX := 1 || robotY := 1 || currentCell := ( entranceSquare ) || visitedCells := [ entranceSquare ] || robotMovement := [] || movingDirection := north

    OPERATIONS
        /* 
            This operation would get the x and the y coordinates of the robot and 
            will check whether they are equal to the exit square coordinates.
        */
        message <-- foundExit =
            BEGIN
                IF ( robotX |-> robotY = exitSquare )
                THEN
                    message := YES
                ELSE
                    message := NO
                END
            END ;

        /*
            Here the current position of the robot would be returned by using the 
            currentCell variable where i updates its value on every move the robot makes
        */
        position <-- getPosition =
            BEGIN
                position := currentCell
            END ;


        // This Operation to inquire whether the robot has visited a certain square 
        visitedSquare <-- hasVisitedSquare ( xPosition , yPosition ) =
        PRE
            visitedSquare : REPORT &
            xPosition = robotX &
            yPosition = robotY
        THEN
        /* 
            We only need the unique set of robot's movements irrespective of the order (or sequence)
            so we need to convert the sequence of the robot's movements back to a set.
            That is why i have taken the range of the sequence to get the set of all unique robot movements (coordinate pairs).
        */
            IF ( { xPosition |-> yPosition } <: ran ( front ( visitedCells ) ) )
            THEN
                visitedSquare := YES
            ELSE
                visitedSquare := NO
            END
        END ;


        routeTaken <-- robotsRoute =
        BEGIN
            routeTaken := visitedCells
        END ;

        /*
            This operation is used to move the robot 1 cell north(i.e upwards)
            ====================================================================================================            
           |COMMON LOGICS USED IN ROBOT MOVEMENT OPS (MoveNorth, MoveSouth, MoveEast, MoveWest, Teleport)       |
            ====================================================================================================
            1.) First it would check if the next square the robot is moving is an empty square.
            2.) If it is an empty square it would update the robots X and Y positions respectively.
            3.) Then it would add the newly moved cell to the visitedCells.
            4.) Finally it would return the relevant message that should be shown
            
            5.) If in case it is not an empty square after the check we did in step 1, 
                it would check whether the new cell value consists in the fullMaze.
            6.) If it is a value in the full maze then it would return a message saying the robot is trying
                to move to an internal cell.
            7.) If the value is not a value in the full Maze it would return a message saying the robot hits
                the wall of the maze.
        */
        message <-- moveNorth =
        BEGIN
            IF
                isEmptyMazeSquare ( robotX , robotY + 1 )
            THEN
                robotY :=  robotY + 1 ||
                visitedCells := visitedCells <- ( robotX |-> robotY + 1 ) ||
                currentCell := ( robotX |-> robotY + 1 ) ||
                message := OPERATION_SUCCESSFUL || movingDirection := north
            ELSE
                IF
                    isOutOfMaze ( robotX , robotY + 1 )
                THEN
                    message := ERROR_maze_wall_detected
                ELSE
                    message := ERROR_internal_wall_detected
                END
            END
        END ;

        // This operation is used to move the robot 1 cell east(i.e left)
        message <-- moveEast =
        BEGIN
            IF
                isEmptyMazeSquare ( robotX + 1 , robotY )
            THEN
                robotX :=  robotX + 1 ||
                visitedCells := visitedCells <- ( robotX + 1 , robotY ) ||
                currentCell := ( robotX + 1 |-> robotY ) ||
                message := OPERATION_SUCCESSFUL || movingDirection := east
            ELSE
                IF
                    isOutOfMaze ( robotX + 1 , robotY )
                THEN
                    message := ERROR_maze_wall_detected
                ELSE
                    message := ERROR_internal_wall_detected
                END
            END
        END ;

        // This operation is used to move the robot 1 cell south(i.e downwards)
        message <-- moveSouth =
        BEGIN
            IF
                isEmptyMazeSquare ( robotX , robotY - 1 )
            THEN
                robotY :=  robotY - 1 ||
                visitedCells := visitedCells <- ( robotX |-> robotY - 1 ) ||
                currentCell := ( robotX |-> robotY - 1 ) ||
                message := OPERATION_SUCCESSFUL || movingDirection := south
            ELSE
                IF
                    isOutOfMaze ( robotX , robotY - 1 )
                THEN
                    message := ERROR_maze_wall_detected
                ELSE
                    message := ERROR_internal_wall_detected
                END
            END
        END ;

        // This operation is used to move the robot 1 cell west(i.e right)
        message <-- moveWest =
        BEGIN
            IF
                isEmptyMazeSquare ( robotX - 1 , robotY )
            THEN
                robotX :=  robotX - 1 ||
                visitedCells := visitedCells <- ( robotX - 1 , robotY ) ||
                currentCell := ( robotX - 1 |-> robotY ) ||
                message := OPERATION_SUCCESSFUL || movingDirection := west
            ELSE
                IF
                    isOutOfMaze ( robotX - 1 , robotY )
                THEN
                    message := ERROR_maze_wall_detected
                ELSE
                    message := ERROR_internal_wall_detected
                END
            END
        END ;

        /*
            This operation is used to teleport the robot to a specific cell in the grid(maze).
        */
        message <-- teleport ( newXPosition , newYPosition ) =
        PRE
            message : REPORT &

            /* 
                The CW SPEC says this operation "The operation inputs a square that the Robot attempts to teleport to" 
                and since it says "SQUARE" i am interpreting that as a precondition that the input should be a coordinate 
                pair for a SQUARE WITHIN THE BOUNDS OF THE MAZE and not a coordinate that corresponds to outer SPACE 
                outside the bounds of the maze.The spec doesn't even define any coordinates for the space outside the maze.
            */
            newXPosition : mazeXSize &
            newYPosition : mazeYSize

        THEN
            IF
                isEmptyMazeSquare ( newXPosition , newYPosition )
            THEN
                robotX := newXPosition ||
                robotY := newYPosition ||
                visitedCells := visitedCells <- ( newXPosition |-> newYPosition ) ||
                currentCell := ( newXPosition |-> newYPosition ) ||
                message := OPERATION_SUCCESSFUL
            ELSE
                IF
                    isOutOfMaze ( newXPosition , newYPosition )
                THEN
                    message := ERROR_attempt_to_move_out_of_maze
                ELSE
                    message := ERROR_internal_wall_detected
                END
            END
        END ;

        // This operation would reset the robot to it's initial state
        message <-- resetRobot =
        BEGIN
            robotX :=  1 ||
            robotY :=  1 ||
            currentCell := ( entranceSquare ) ||
            visitedCells := [ entranceSquare ] ||
            robotMovement := [] ||
            message := OPERATION_SUCCESSFUL || movingDirection := north
        END


END
