/* maze
 * Author: Pasan
 * Creation date: 11/27/2022
 */
MACHINE
    maze

    CONSTANTS
    mazeXSize, mazeYSize, fullMazeSice, internalWalls, emptyWalls, entranceSquare, exitSquare

    PROPERTIES
    mazeXSize = 1..7 &
    mazeYSize = 1..5 &
    fullMazeSize = mazeXSize * mazeYSize &
    internalWalls <: fullMazeSize &
    internalWalls = {(1|->3), (2|->1), (2|->3), (2|->5), (3|->3), (4|->2), (4|->3), (4|->4), (6|->1), (6|->2), (6|->4), (7|->4)} &
    emptyWalls <: fullMazeSize &
    entranceSquare = {(1|->1)} &
    exitSquare = {(1|->5)}
    
END
