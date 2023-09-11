type
  Position* = enum
    # keyboard input positions
    q, w, e,
    a, s, d,
    z, x, c,
  Mark* = enum
    empty = " ", X, O  # Capitialized enums are non idiomatic
  Grid* = array[Position, Mark]

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

func isAvailable*(g: Grid, pos: Position): bool =
  g[pos] == empty

when isMainModule:
  var g = newGrid()
  echo g
  type Move = tuple[mark: Mark, pos: Position]
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
    echo "move: ", move
    assert g.isAvailable move.pos
    g[move.pos] = move.mark
    echo g
