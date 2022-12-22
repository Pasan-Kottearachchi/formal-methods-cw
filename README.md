# 6SENG005C-Formal-Methods
## Robot Maze Coursework Implementation

![robot-maze-cw](https://github.com/Pasan-Kottearachchi/formal-methods-cw/blob/develop/images/cw-robot-maze-imge.png)


- The figure aboves gives the layout of the rectangular shaped maze, the Robot is represented by "•" & its.
- starting position is the entry square (1, 1).
- The aim is to move the robot from the operations to get to the exit square of the maze (1, 5). entry square through the maze using the various movement

### Notes
- The squares of the maze form a grid of squares 7 wide by 5 high.
- The robot occupies only one square at a time & can only be in an "empty maze square", i.e. a
square inside the maze and not one of the maze's internal walls.
- The robot can be moved around the maze by using one of four directions: North ↑ , South ↓ ,
East → and West ← ; or it can "teleport" to one of the maze's "path" squares.
- Once the robot has found the exit square it can not make any further moves.


 - For example, the robot can be in square (5, 3), one of the maze's "path" squares, but not (4, 2) an "internal wall" square.
 The robot starts off in the entrance square , i.e. the bottom left square (1, 1).

&nbsp;

---
&nbsp;

## Features to be developed
#### Sets and Constants
Any sets and constants that are required to define the data and state of the maze and robot, and their properties.
(Hints: Represent the maze and the maze's internal walls as relations.)

#### System State
The state variables required to represent the data for the robot and the maze. Including the stateinvariant and initialisation.

#### Robot Movement Operations in the Maze
- MoveNorth
- MoveSouth
- MoveEast
- MoveWest
- Teleport

> Note the maze, i.e. attempting to move North when in square (4, 5), or an internal maze wall, i.e. attempting that if any attempted movement can not be performed, either because of the boundary wall of
to move East when in square (3, 2), then an error message is output indicating the reason it could not make the move.


> The Robot can also "teleport" to a "path" square within the maze. The operation inputs a square that the Robot attempts to teleport to. If the input square is suitable for the Robot to teleport to it does so and reports success. However, if it is not a suitable square for it to teleport to, it outputs an error message indicating why.

*Note that all operations must report the outcome of an attempted movement, that is, either it was successful, failed due to the maze's boundary, failed due to an internal wall, or for some other reason.*


#### Enquiry Operations about Robot in the Maze
You must also specify the following enquiry operations, that all output information about the state of the Robot:
- getPosition - outputs the current position of the robot in the maze.
- foundExit - outputs yes if the robot is currently in the exit square of the maze, no otherwise.
- hasVisitedSquare - inputs a square and reports yes if that square has been previously visited by the robot, no otherwise.

*Note that a square is designated as having being visited by the Robot if it has been on the square more than once. That is, a square "has been visited" only after the robot has been on it and then has moved off it*

#### Reset Operation
A Reset operation to reinitialise the system, i.e. moves the robot back to the entry square, deletes the robots route and visited squares

&nbsp;
___
&nbsp;

## Items to be Submitted
- The Structure Diagram of the Maze & Robot System, in terms of the abstract machine(s) used
to specify it. You must also include as a note with the diagram a "Plain English" explanation of the "state invariants" of the system.
- The B Specification of the Maze & Robot System, i.e. the abstract machine(s) : all B machine plain ASCII Text files: ".mch".
- A Graph representation of a complete ProB Animation Session history. Using ProB perform an
animation session that shows how the Robot is moved from the entry square to the exit square
using a combination of all of the movement operations , e.g. MoveNorth, MoveSouth,
MoveEast, MoveWest and Teleport , the route does not need to be the shortest. View this
Animation Session as a "DOT" graph and then save it.
- Screen shot images (.png or .jpg or .jpeg) showing the use of the B tools to develop, animate and analyse the Maze & Robot B specification:
    - Atelier B syntax & type checking: 1 image showing the Atelier B main type check window
and editor window showing the specification. (File: AtelierB.png)
    - ProB initialisation: 1 image showing the initialised specification in ProB. (File:
ProB_initialisation.png)
    - ProB animation: 1 image showing ProB at the end of the animation that corresponds to the
journey from the entry square to the exit square, i.e. the final state represented in the DOT
graph. (File: ProB_animation .png)
    -  ProB analysis: 1 (or more) images showing ProB's “ Evaluation View ” terminal displaying the value of the INVARIANT, PROPERTIES and OPERATIONS. (File(s): ProB_EV_1 .png,
ProB_EV_2 .png, ... )
    - ProB analysis: 1 image showing the use of ProB's “ Eval ” terminal to showing the value of the variables at the end of the journey animation. (File: ProB_Eval .png )











