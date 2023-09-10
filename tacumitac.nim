type
  Position* = enum
    NW, N, NE
     W, C, E
    SW, S, SE
  Cell* = enum
    Empty = " ", X, O
  Grid* = array[Position, Cell]

func `$`*(g: Grid): string =
  $g[NW] & '|' & $g[N] & '|' & $g[NE] & '\n' &
  "-----\n" &
  $g[W] & '|' & $g[C] & '|' & $g[E] & '\n' &
  "-----\n" &
  $g[SW] & '|' & $g[S] & '|' & $g[SE] & '\n'

func newGame*: Grid = result

when isMainModule:
  var g = newGame()
  echo g
