/* maze
 * Author: Pasan
 * Creation date: 1/2/2023
 */
MACHINE
    maze
    
   CONSTANTS
        // Maze Constants
        mazeXSize, mazeYSize, fullMaze, internalWalls, emptyMazeSquares, entranceSquare, exitSquare
  
    PROPERTIES
        mazeXSize <: NAT1 & 
        mazeXSize = 1..7 &
        mazeYSize <: NAT1 & 
        mazeYSize = 1..5 &

        // Maze Properties
        // The full maze is made up by the Cartesian product of the mazeXSize and mazeYSize.
        fullMaze = mazeXSize * mazeYSize &
        
        /*
            These are blocks of walls which is placed in the grid in  order to make the grid a maze.
            The coordinated of the internal walls should be belong to the coordinates of the full maze structure which is take as the fullMaze
        */
        internalWalls <: fullMaze &
        internalWalls = {1|->3, 2|->1, 2|->3, 2|->5, 3|->3, 4|->2, 4|->3, 4|->4, 6|->1, 6|->2, 6|->4, 7|->4} &
        
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
        entranceSquare = 1|->1 &
        
        exitSquare = 1|->5 &
        exitSquare : emptyMazeSquares

END
