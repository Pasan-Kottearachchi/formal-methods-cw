Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(robot))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(robot))==(Machine(robot));
  Level(Machine(robot))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(robot)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(robot))==(maze)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(robot))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(robot))==(?);
  List_Includes(Machine(robot))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(robot))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(robot))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(robot))==(?);
  Context_List_Variables(Machine(robot))==(?);
  Abstract_List_Variables(Machine(robot))==(?);
  Local_List_Variables(Machine(robot))==(movingDirection,currentCell,robotMovement,visitedCells,robotY,robotX);
  List_Variables(Machine(robot))==(movingDirection,currentCell,robotMovement,visitedCells,robotY,robotX);
  External_List_Variables(Machine(robot))==(movingDirection,currentCell,robotMovement,visitedCells,robotY,robotX)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(robot))==(?);
  Abstract_List_VisibleVariables(Machine(robot))==(?);
  External_List_VisibleVariables(Machine(robot))==(?);
  Expanded_List_VisibleVariables(Machine(robot))==(?);
  List_VisibleVariables(Machine(robot))==(?);
  Internal_List_VisibleVariables(Machine(robot))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(robot))==(btrue);
  Gluing_List_Invariant(Machine(robot))==(btrue);
  Expanded_List_Invariant(Machine(robot))==(btrue);
  Abstract_List_Invariant(Machine(robot))==(btrue);
  Context_List_Invariant(Machine(robot))==(btrue);
  List_Invariant(Machine(robot))==(robotX: mazeXSize & robotY: mazeYSize & movingDirection: DIRECTIONS & robotMovement: seq(DIRECTIONS) & currentCell: fullMaze & visitedCells: seq(emptyMazeSquares))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(robot))==(btrue);
  Abstract_List_Assertions(Machine(robot))==(btrue);
  Context_List_Assertions(Machine(robot))==(btrue);
  List_Assertions(Machine(robot))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(robot))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(robot))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(robot))==(robotX,robotY,currentCell,visitedCells,robotMovement,movingDirection:=1,1,entranceSquare,[entranceSquare],<>,north);
  Context_List_Initialisation(Machine(robot))==(skip);
  List_Initialisation(Machine(robot))==(robotX:=1 || robotY:=1 || currentCell:=entranceSquare || visitedCells:=[entranceSquare] || robotMovement:=<> || movingDirection:=north)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(robot))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(robot),Machine(maze))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(robot))==(btrue);
  List_Constraints(Machine(robot))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(robot))==(foundExit,getPosition,hasVisitedSquare,robotsRoute,moveNorth,moveEast,moveSouth,moveWest,teleport,resetRobot);
  List_Operations(Machine(robot))==(foundExit,getPosition,hasVisitedSquare,robotsRoute,moveNorth,moveEast,moveSouth,moveWest,teleport,resetRobot)
END
&
THEORY ListInputX IS
  List_Input(Machine(robot),foundExit)==(?);
  List_Input(Machine(robot),getPosition)==(?);
  List_Input(Machine(robot),hasVisitedSquare)==(xPosition,yPosition);
  List_Input(Machine(robot),robotsRoute)==(?);
  List_Input(Machine(robot),moveNorth)==(?);
  List_Input(Machine(robot),moveEast)==(?);
  List_Input(Machine(robot),moveSouth)==(?);
  List_Input(Machine(robot),moveWest)==(?);
  List_Input(Machine(robot),teleport)==(newXPosition,newYPosition);
  List_Input(Machine(robot),resetRobot)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(robot),foundExit)==(message);
  List_Output(Machine(robot),getPosition)==(position);
  List_Output(Machine(robot),hasVisitedSquare)==(visitedSquare);
  List_Output(Machine(robot),robotsRoute)==(routeTaken);
  List_Output(Machine(robot),moveNorth)==(message);
  List_Output(Machine(robot),moveEast)==(message);
  List_Output(Machine(robot),moveSouth)==(message);
  List_Output(Machine(robot),moveWest)==(message);
  List_Output(Machine(robot),teleport)==(message);
  List_Output(Machine(robot),resetRobot)==(message)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(robot),foundExit)==(message <-- foundExit);
  List_Header(Machine(robot),getPosition)==(position <-- getPosition);
  List_Header(Machine(robot),hasVisitedSquare)==(visitedSquare <-- hasVisitedSquare(xPosition,yPosition));
  List_Header(Machine(robot),robotsRoute)==(routeTaken <-- robotsRoute);
  List_Header(Machine(robot),moveNorth)==(message <-- moveNorth);
  List_Header(Machine(robot),moveEast)==(message <-- moveEast);
  List_Header(Machine(robot),moveSouth)==(message <-- moveSouth);
  List_Header(Machine(robot),moveWest)==(message <-- moveWest);
  List_Header(Machine(robot),teleport)==(message <-- teleport(newXPosition,newYPosition));
  List_Header(Machine(robot),resetRobot)==(message <-- resetRobot)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(robot),foundExit)==(btrue);
  List_Precondition(Machine(robot),getPosition)==(btrue);
  List_Precondition(Machine(robot),hasVisitedSquare)==(visitedSquare: REPORT & xPosition = robotX & yPosition = robotY);
  List_Precondition(Machine(robot),robotsRoute)==(btrue);
  List_Precondition(Machine(robot),moveNorth)==(btrue);
  List_Precondition(Machine(robot),moveEast)==(btrue);
  List_Precondition(Machine(robot),moveSouth)==(btrue);
  List_Precondition(Machine(robot),moveWest)==(btrue);
  List_Precondition(Machine(robot),teleport)==(message: REPORT & newXPosition: mazeXSize & newYPosition: mazeYSize);
  List_Precondition(Machine(robot),resetRobot)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(robot),resetRobot)==(btrue | robotX,robotY,currentCell,visitedCells,robotMovement,message,movingDirection:=1,1,entranceSquare,[entranceSquare],<>,OPERATION_SUCCESSFUL,north);
  Expanded_List_Substitution(Machine(robot),teleport)==(message: REPORT & newXPosition: mazeXSize & newYPosition: mazeYSize | robotX|->robotY = exitSquare ==> message:=FOUND_EXIT_prohibited_robot_movements [] not(robotX|->robotY = exitSquare) ==> (newXPosition|->newYPosition: emptyMazeSquares ==> robotX,robotY,visitedCells,currentCell,message:=newXPosition,newYPosition,visitedCells<-(newXPosition|->newYPosition),newXPosition|->newYPosition,OPERATION_SUCCESSFUL [] not(newXPosition|->newYPosition: emptyMazeSquares) ==> (newXPosition|->newYPosition/:fullMaze ==> message:=ERROR_attempt_to_move_out_of_maze [] not(newXPosition|->newYPosition/:fullMaze) ==> message:=ERROR_internal_wall_detected)));
  Expanded_List_Substitution(Machine(robot),moveWest)==(btrue | robotX|->robotY = exitSquare ==> message:=FOUND_EXIT_prohibited_robot_movements [] not(robotX|->robotY = exitSquare) ==> (robotX-1|->robotY: emptyMazeSquares ==> robotX,visitedCells,currentCell,message,movingDirection:=robotX-1,visitedCells<-(robotX-1,robotY),robotX-1|->robotY,OPERATION_SUCCESSFUL,west [] not(robotX-1|->robotY: emptyMazeSquares) ==> (robotX-1|->robotY/:fullMaze ==> message:=ERROR_maze_wall_detected [] not(robotX-1|->robotY/:fullMaze) ==> message:=ERROR_internal_wall_detected)));
  Expanded_List_Substitution(Machine(robot),moveSouth)==(btrue | robotX|->robotY = exitSquare ==> message:=FOUND_EXIT_prohibited_robot_movements [] not(robotX|->robotY = exitSquare) ==> (robotX|->robotY-1: emptyMazeSquares ==> robotY,visitedCells,currentCell,message,movingDirection:=robotY-1,visitedCells<-(robotX|->robotY-1),robotX|->robotY-1,OPERATION_SUCCESSFUL,south [] not(robotX|->robotY-1: emptyMazeSquares) ==> (robotX|->robotY-1/:fullMaze ==> message:=ERROR_maze_wall_detected [] not(robotX|->robotY-1/:fullMaze) ==> message:=ERROR_internal_wall_detected)));
  Expanded_List_Substitution(Machine(robot),moveEast)==(btrue | robotX|->robotY = exitSquare ==> message:=FOUND_EXIT_prohibited_robot_movements [] not(robotX|->robotY = exitSquare) ==> (robotX+1|->robotY: emptyMazeSquares ==> robotX,visitedCells,currentCell,message,movingDirection:=robotX+1,visitedCells<-(robotX+1,robotY),robotX+1|->robotY,OPERATION_SUCCESSFUL,east [] not(robotX+1|->robotY: emptyMazeSquares) ==> (robotX+1|->robotY/:fullMaze ==> message:=ERROR_maze_wall_detected [] not(robotX+1|->robotY/:fullMaze) ==> message:=ERROR_internal_wall_detected)));
  Expanded_List_Substitution(Machine(robot),moveNorth)==(btrue | robotX|->robotY = exitSquare ==> message:=FOUND_EXIT_prohibited_robot_movements [] not(robotX|->robotY = exitSquare) ==> (robotX|->robotY+1: emptyMazeSquares ==> robotY,visitedCells,currentCell,message,movingDirection:=robotY+1,visitedCells<-(robotX|->robotY+1),robotX|->robotY+1,OPERATION_SUCCESSFUL,north [] not(robotX|->robotY+1: emptyMazeSquares) ==> (robotX|->robotY+1/:fullMaze ==> message:=ERROR_maze_wall_detected [] not(robotX|->robotY+1/:fullMaze) ==> message:=ERROR_internal_wall_detected)));
  Expanded_List_Substitution(Machine(robot),robotsRoute)==(btrue | routeTaken:=visitedCells);
  Expanded_List_Substitution(Machine(robot),hasVisitedSquare)==(visitedSquare: REPORT & xPosition = robotX & yPosition = robotY | {xPosition|->yPosition} <: ran(front(visitedCells)) ==> visitedSquare:=YES [] not({xPosition|->yPosition} <: ran(front(visitedCells))) ==> visitedSquare:=NO);
  Expanded_List_Substitution(Machine(robot),getPosition)==(btrue | position:=currentCell);
  Expanded_List_Substitution(Machine(robot),foundExit)==(btrue | robotX|->robotY = exitSquare ==> message:=YES [] not(robotX|->robotY = exitSquare) ==> message:=NO);
  List_Substitution(Machine(robot),foundExit)==(IF robotX|->robotY = exitSquare THEN message:=YES ELSE message:=NO END);
  List_Substitution(Machine(robot),getPosition)==(position:=currentCell);
  List_Substitution(Machine(robot),hasVisitedSquare)==(IF {xPosition|->yPosition} <: ran(front(visitedCells)) THEN visitedSquare:=YES ELSE visitedSquare:=NO END);
  List_Substitution(Machine(robot),robotsRoute)==(routeTaken:=visitedCells);
  List_Substitution(Machine(robot),moveNorth)==(IF robotX|->robotY = exitSquare THEN message:=FOUND_EXIT_prohibited_robot_movements ELSE IF robotX|->robotY+1: emptyMazeSquares THEN robotY:=robotY+1 || visitedCells:=visitedCells<-(robotX|->robotY+1) || currentCell:=robotX|->robotY+1 || message:=OPERATION_SUCCESSFUL || movingDirection:=north ELSE IF robotX|->robotY+1/:fullMaze THEN message:=ERROR_maze_wall_detected ELSE message:=ERROR_internal_wall_detected END END END);
  List_Substitution(Machine(robot),moveEast)==(IF robotX|->robotY = exitSquare THEN message:=FOUND_EXIT_prohibited_robot_movements ELSE IF robotX+1|->robotY: emptyMazeSquares THEN robotX:=robotX+1 || visitedCells:=visitedCells<-(robotX+1,robotY) || currentCell:=robotX+1|->robotY || message:=OPERATION_SUCCESSFUL || movingDirection:=east ELSE IF robotX+1|->robotY/:fullMaze THEN message:=ERROR_maze_wall_detected ELSE message:=ERROR_internal_wall_detected END END END);
  List_Substitution(Machine(robot),moveSouth)==(IF robotX|->robotY = exitSquare THEN message:=FOUND_EXIT_prohibited_robot_movements ELSE IF robotX|->robotY-1: emptyMazeSquares THEN robotY:=robotY-1 || visitedCells:=visitedCells<-(robotX|->robotY-1) || currentCell:=robotX|->robotY-1 || message:=OPERATION_SUCCESSFUL || movingDirection:=south ELSE IF robotX|->robotY-1/:fullMaze THEN message:=ERROR_maze_wall_detected ELSE message:=ERROR_internal_wall_detected END END END);
  List_Substitution(Machine(robot),moveWest)==(IF robotX|->robotY = exitSquare THEN message:=FOUND_EXIT_prohibited_robot_movements ELSE IF robotX-1|->robotY: emptyMazeSquares THEN robotX:=robotX-1 || visitedCells:=visitedCells<-(robotX-1,robotY) || currentCell:=robotX-1|->robotY || message:=OPERATION_SUCCESSFUL || movingDirection:=west ELSE IF robotX-1|->robotY/:fullMaze THEN message:=ERROR_maze_wall_detected ELSE message:=ERROR_internal_wall_detected END END END);
  List_Substitution(Machine(robot),teleport)==(IF robotX|->robotY = exitSquare THEN message:=FOUND_EXIT_prohibited_robot_movements ELSE IF newXPosition|->newYPosition: emptyMazeSquares THEN robotX:=newXPosition || robotY:=newYPosition || visitedCells:=visitedCells<-(newXPosition|->newYPosition) || currentCell:=newXPosition|->newYPosition || message:=OPERATION_SUCCESSFUL ELSE IF newXPosition|->newYPosition/:fullMaze THEN message:=ERROR_attempt_to_move_out_of_maze ELSE message:=ERROR_internal_wall_detected END END END);
  List_Substitution(Machine(robot),resetRobot)==(robotX:=1 || robotY:=1 || currentCell:=entranceSquare || visitedCells:=[entranceSquare] || robotMovement:=<> || message:=OPERATION_SUCCESSFUL || movingDirection:=north)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(robot))==(?);
  Inherited_List_Constants(Machine(robot))==(?);
  List_Constants(Machine(robot))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(robot),DIRECTIONS)==({north,south,east,west});
  Context_List_Enumerated(Machine(robot))==(?);
  Context_List_Defered(Machine(robot))==(?);
  Context_List_Sets(Machine(robot))==(?);
  List_Valuable_Sets(Machine(robot))==(?);
  Inherited_List_Enumerated(Machine(robot))==(?);
  Inherited_List_Defered(Machine(robot))==(?);
  Inherited_List_Sets(Machine(robot))==(?);
  List_Enumerated(Machine(robot))==(DIRECTIONS,REPORT);
  List_Defered(Machine(robot))==(?);
  List_Sets(Machine(robot))==(DIRECTIONS,REPORT);
  Set_Definition(Machine(robot),REPORT)==({OPERATION_SUCCESSFUL,ERROR_internal_wall_detected,ERROR_maze_wall_detected,ERROR_attempt_to_move_out_of_maze,FOUND_EXIT_prohibited_robot_movements,YES,NO})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(robot))==(?);
  Expanded_List_HiddenConstants(Machine(robot))==(?);
  List_HiddenConstants(Machine(robot))==(?);
  External_List_HiddenConstants(Machine(robot))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(robot))==(btrue);
  Context_List_Properties(Machine(robot))==(mazeXSize <: NAT1 & mazeXSize = 1..7 & mazeYSize <: NAT1 & mazeYSize = 1..5 & fullMaze = mazeXSize*mazeYSize & internalWalls <: fullMaze & internalWalls = {1|->3,2|->1,2|->3,2|->5,3|->3,4|->2,4|->3,4|->4,6|->1,6|->2,6|->4,7|->4} & emptyMazeSquares <: fullMaze & emptyMazeSquares/\internalWalls = {} & emptyMazeSquares\/internalWalls = fullMaze & entranceSquare: emptyMazeSquares & entranceSquare = 1|->1 & exitSquare = 1|->5 & exitSquare: emptyMazeSquares);
  Inherited_List_Properties(Machine(robot))==(btrue);
  List_Properties(Machine(robot))==(DIRECTIONS: FIN(INTEGER) & not(DIRECTIONS = {}) & REPORT: FIN(INTEGER) & not(REPORT = {}))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(robot),Machine(maze))==(?);
  Seen_Context_List_Enumerated(Machine(robot))==(?);
  Seen_Context_List_Invariant(Machine(robot))==(btrue);
  Seen_Context_List_Assertions(Machine(robot))==(btrue);
  Seen_Context_List_Properties(Machine(robot))==(btrue);
  Seen_List_Constraints(Machine(robot))==(btrue);
  Seen_List_Operations(Machine(robot),Machine(maze))==(?);
  Seen_Expanded_List_Invariant(Machine(robot),Machine(maze))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(robot),foundExit)==(?);
  List_ANY_Var(Machine(robot),getPosition)==(?);
  List_ANY_Var(Machine(robot),hasVisitedSquare)==(?);
  List_ANY_Var(Machine(robot),robotsRoute)==(?);
  List_ANY_Var(Machine(robot),moveNorth)==(?);
  List_ANY_Var(Machine(robot),moveEast)==(?);
  List_ANY_Var(Machine(robot),moveSouth)==(?);
  List_ANY_Var(Machine(robot),moveWest)==(?);
  List_ANY_Var(Machine(robot),teleport)==(?);
  List_ANY_Var(Machine(robot),resetRobot)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(robot)) == (DIRECTIONS,REPORT,north,south,east,west,OPERATION_SUCCESSFUL,ERROR_internal_wall_detected,ERROR_maze_wall_detected,ERROR_attempt_to_move_out_of_maze,FOUND_EXIT_prohibited_robot_movements,YES,NO | ? | movingDirection,currentCell,robotMovement,visitedCells,robotY,robotX | ? | foundExit,getPosition,hasVisitedSquare,robotsRoute,moveNorth,moveEast,moveSouth,moveWest,teleport,resetRobot | ? | seen(Machine(maze)) | ? | robot);
  List_Of_HiddenCst_Ids(Machine(robot)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(robot)) == (?);
  List_Of_VisibleVar_Ids(Machine(robot)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(robot)) == (?: ?);
  List_Of_Ids(Machine(maze)) == (mazeXSize,mazeYSize,fullMaze,internalWalls,emptyMazeSquares,entranceSquare,exitSquare | ? | ? | ? | ? | ? | ? | ? | maze);
  List_Of_HiddenCst_Ids(Machine(maze)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(maze)) == (mazeXSize,mazeYSize,fullMaze,internalWalls,emptyMazeSquares,entranceSquare,exitSquare);
  List_Of_VisibleVar_Ids(Machine(maze)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(maze)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(robot)) == (Type(DIRECTIONS) == Cst(SetOf(etype(DIRECTIONS,0,3)));Type(REPORT) == Cst(SetOf(etype(REPORT,0,6))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(robot)) == (Type(north) == Cst(etype(DIRECTIONS,0,3));Type(south) == Cst(etype(DIRECTIONS,0,3));Type(east) == Cst(etype(DIRECTIONS,0,3));Type(west) == Cst(etype(DIRECTIONS,0,3));Type(OPERATION_SUCCESSFUL) == Cst(etype(REPORT,0,6));Type(ERROR_internal_wall_detected) == Cst(etype(REPORT,0,6));Type(ERROR_maze_wall_detected) == Cst(etype(REPORT,0,6));Type(ERROR_attempt_to_move_out_of_maze) == Cst(etype(REPORT,0,6));Type(FOUND_EXIT_prohibited_robot_movements) == Cst(etype(REPORT,0,6));Type(YES) == Cst(etype(REPORT,0,6));Type(NO) == Cst(etype(REPORT,0,6)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(robot)) == (Type(movingDirection) == Mvl(etype(DIRECTIONS,?,?));Type(currentCell) == Mvl(btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(robotMovement) == Mvl(SetOf(btype(INTEGER,?,?)*etype(DIRECTIONS,?,?)));Type(visitedCells) == Mvl(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))));Type(robotY) == Mvl(btype(INTEGER,?,?));Type(robotX) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(robot)) == (Type(resetRobot) == Cst(etype(REPORT,?,?),No_type);Type(teleport) == Cst(etype(REPORT,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(moveWest) == Cst(etype(REPORT,?,?),No_type);Type(moveSouth) == Cst(etype(REPORT,?,?),No_type);Type(moveEast) == Cst(etype(REPORT,?,?),No_type);Type(moveNorth) == Cst(etype(REPORT,?,?),No_type);Type(robotsRoute) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(hasVisitedSquare) == Cst(etype(REPORT,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(getPosition) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type);Type(foundExit) == Cst(etype(REPORT,?,?),No_type));
  Observers(Machine(robot)) == (Type(robotsRoute) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(hasVisitedSquare) == Cst(etype(REPORT,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(getPosition) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type);Type(foundExit) == Cst(etype(REPORT,?,?),No_type))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
