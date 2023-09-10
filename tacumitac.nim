type
  Position* = enum
    NW, N, NE
     W, C, E
    SW, S, SE
  Cell* = enum
    Empty = " ", X, O
  Grid* = array[Position, Cell]
  Move* = tuple[pos: Position, val: Cell]

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
  let exampleGame = [
    (C, X).Move,
    (NE, O),
    (E, X),
    (W, O),
    (S, X),
    (N, O),
    (NW, X),
    (SE, O),
    ]
  for i, move in exampleGame:
    echo "\nMove " & $i & ":\n"
    g[move.pos] = move.val
    echo g
