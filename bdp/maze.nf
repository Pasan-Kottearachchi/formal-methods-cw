Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(maze))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(maze))==(Machine(maze));
  Level(Machine(maze))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(maze)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(maze))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(maze))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(maze))==(?);
  List_Includes(Machine(maze))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(maze))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(maze))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(maze))==(?);
  Context_List_Variables(Machine(maze))==(?);
  Abstract_List_Variables(Machine(maze))==(?);
  Local_List_Variables(Machine(maze))==(?);
  List_Variables(Machine(maze))==(?);
  External_List_Variables(Machine(maze))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(maze))==(?);
  Abstract_List_VisibleVariables(Machine(maze))==(?);
  External_List_VisibleVariables(Machine(maze))==(?);
  Expanded_List_VisibleVariables(Machine(maze))==(?);
  List_VisibleVariables(Machine(maze))==(?);
  Internal_List_VisibleVariables(Machine(maze))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(maze))==(btrue);
  Gluing_List_Invariant(Machine(maze))==(btrue);
  Expanded_List_Invariant(Machine(maze))==(btrue);
  Abstract_List_Invariant(Machine(maze))==(btrue);
  Context_List_Invariant(Machine(maze))==(btrue);
  List_Invariant(Machine(maze))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(maze))==(btrue);
  Abstract_List_Assertions(Machine(maze))==(btrue);
  Context_List_Assertions(Machine(maze))==(btrue);
  List_Assertions(Machine(maze))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(maze))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(maze))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(maze))==(skip);
  Context_List_Initialisation(Machine(maze))==(skip);
  List_Initialisation(Machine(maze))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(maze))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(maze))==(btrue);
  List_Constraints(Machine(maze))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(maze))==(?);
  List_Operations(Machine(maze))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(maze))==(mazeXSize,mazeYSize,fullMaze,internalWalls,emptyMazeSquares,entranceSquare,exitSquare);
  Inherited_List_Constants(Machine(maze))==(?);
  List_Constants(Machine(maze))==(mazeXSize,mazeYSize,fullMaze,internalWalls,emptyMazeSquares,entranceSquare,exitSquare)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(maze))==(?);
  Context_List_Defered(Machine(maze))==(?);
  Context_List_Sets(Machine(maze))==(?);
  List_Valuable_Sets(Machine(maze))==(?);
  Inherited_List_Enumerated(Machine(maze))==(?);
  Inherited_List_Defered(Machine(maze))==(?);
  Inherited_List_Sets(Machine(maze))==(?);
  List_Enumerated(Machine(maze))==(?);
  List_Defered(Machine(maze))==(?);
  List_Sets(Machine(maze))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(maze))==(?);
  Expanded_List_HiddenConstants(Machine(maze))==(?);
  List_HiddenConstants(Machine(maze))==(?);
  External_List_HiddenConstants(Machine(maze))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(maze))==(btrue);
  Context_List_Properties(Machine(maze))==(btrue);
  Inherited_List_Properties(Machine(maze))==(btrue);
  List_Properties(Machine(maze))==(mazeXSize <: NAT1 & mazeXSize = 1..7 & mazeYSize <: NAT1 & mazeYSize = 1..5 & fullMaze = mazeXSize*mazeYSize & internalWalls <: fullMaze & internalWalls = {1|->3,2|->1,2|->3,2|->5,3|->3,4|->2,4|->3,4|->4,6|->1,6|->2,6|->4,7|->4} & emptyMazeSquares <: fullMaze & emptyMazeSquares/\internalWalls = {} & emptyMazeSquares\/internalWalls = fullMaze & entranceSquare: emptyMazeSquares & entranceSquare = 1|->1 & exitSquare = 1|->5 & exitSquare: emptyMazeSquares)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(maze)) == (mazeXSize,mazeYSize,fullMaze,internalWalls,emptyMazeSquares,entranceSquare,exitSquare | ? | ? | ? | ? | ? | ? | ? | maze);
  List_Of_HiddenCst_Ids(Machine(maze)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(maze)) == (mazeXSize,mazeYSize,fullMaze,internalWalls,emptyMazeSquares,entranceSquare,exitSquare);
  List_Of_VisibleVar_Ids(Machine(maze)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(maze)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(maze)) == (Type(mazeXSize) == Cst(SetOf(btype(INTEGER,"[mazeXSize","]mazeXSize")));Type(mazeYSize) == Cst(SetOf(btype(INTEGER,"[mazeYSize","]mazeYSize")));Type(fullMaze) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(internalWalls) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(emptyMazeSquares) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(entranceSquare) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(exitSquare) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)))
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
