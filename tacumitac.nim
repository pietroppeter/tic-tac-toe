type
  Position* = enum
    NW, N, NE
     W, C, E
    SW, S, SE
  Cell* = enum
    Empty = " ", X, O
  Grid* = array[Position, Cell]
  Move* = tuple[pos: Position, val: Cell]

# https://en.wikipedia.org/wiki/Box-drawing_character
const 
  vert = "│"
  horz = "─┼─┼─"

func `$`*(g: Grid): string =
  $g[NW] & vert & $g[N] & vert & $g[NE] & '\n' &
  horz & '\n' &
  $g[W] & vert & $g[C] & vert & $g[E] & '\n' &
  horz & '\n' &
  $g[SW] & vert & $g[S] & vert & $g[SE]

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
