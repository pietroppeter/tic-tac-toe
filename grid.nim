type
  Position* = enum
    # keyboard input positions
    q, w, e,
    a, s, d,
    z, x, c,
  Mark* = enum
    empty = " ", X, O  # Capitialized enums are non idiomatic
  Grid* = array[Position, Mark]
  Move* = tuple[mark: Mark, pos: Position]

# https://en.wikipedia.org/wiki/Box-drawing_character
const 
  vert = "│"
  horizontal = "─┼─┼─"

func `$`*(g: array[Position, string]): string =
  # string in array used to support unicode and terminal codes
  g[q] & vert & g[w] & vert & g[e] & '\n' &
  horizontal & '\n' &
  g[a] & vert & g[s] & vert & g[d] & '\n' &
  horizontal & '\n' &
  g[z] & vert & g[x] & vert & g[c]

func `$`*(g: Grid): string =
  let g: array[Position, string] = [
    $g[q], $g[w], $g[e],
    $g[a], $g[s], $g[d], 
    $g[z], $g[x], $g[c], 
  ]
  $g

func newGrid*: Grid = result

func isAvailable*(g: Grid, move: Move): bool =
  g[move.pos] == empty

func availablePositions*(g: Grid): seq[Position] =
  for pos in Position:
    if g[pos] == empty:
      result.add pos

proc update*(g: var Grid, move: Move) =
  g[move.pos] = move.mark

func win(grid : Grid, line: array[3, Position]): Mark =
  ## Empty means no, X or O means win
  let
    A = grid[line[0]]
    B = grid[line[1]]
    C = grid[line[2]]
  if A != empty and A == B and B == C:
    A
  else:
    empty

const threes = [
  # horizontal
  [q, w, e],
  [a, s, d],
  [z, x, c],
  # vertical
  [q, a, z],
  [w, s, x],
  [e, d, c],
  # diagonal
  [q, s, c],
  [e, s, z],
]

func win*(grid: Grid): Mark =
  ## Empty means no, X or O means win
  for line in threes:
    case grid.win(line)
    of empty:
      continue
    of X:
      return X
    of O:
      return O

func isPlayable*(grid: Grid): bool =
  for pos in Position:
    if grid[pos] == empty:
      return true
  false

when isMainModule:
  var g = newGrid()
  echo g
  for move in [
      (X,q).Move,
      (O,s),
      (X,e),
      (O,w),
      (X,x),
      (O,a),
      (X,d),
      (O,c),
      (X,z),
      ]:
    echo ""
    echo "move: ", move
    assert g.isAvailable move
    g.update move
    echo g
  assert not g.isPlayable
  assert g.win == empty
  echo "it's a draw!"
  echo ""

  var move = (O, d)
  echo "cheat: ", move
  g.update move
  echo g
  assert g.win == O
  echo "O won!"
  echo ""

  move = (X, w)
  echo "better cheat: ", move
  g.update move
  echo g
  assert g.win == X
  echo "X won!"
  # (note both X and O have three in a row)
