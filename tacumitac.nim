import std / [options, strformat]

type
  Position* = enum
    NW, N, NE
     W, C, E
    SW, S, SE
  Cell* = enum
    Empty = " ", X, O
  Grid* = array[Position, Cell]

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

func isAvailable*(g: Grid, pos: Position): bool =
  g[pos] == Empty

# player 
type
  Player* = ref object of RootObj
    name: string
  SequentialPlayer* = ref object of Player
    moves: seq[Position]
  Move* = Option[Position]

method play*(p: Player, g: Grid): Move {. base .} = 
  raise newException(CatchableError, "Method without implementation override")

method play*(p: SequentialPlayer, g: Grid): Move =
  debugEcho "play p.moves: ", p.moves
  for move in p.moves:
    if g.isAvailable(move):
      return some(move)
  none(Position)

type
  Outcome* = enum
    ongoing,
    draw, trisX, trisO, # trisX means X wins
    resignX, resignO # resignX means O wins

func isTris*(game : Grid, line: array[3, Position]): Cell =
  ## Empty means no, X or O means it is a tris
  let
    A = game[line[0]]
    B = game[line[1]]
    C = game[line[2]]
  if A != Empty and A == B and B == C:
    A
  else:
    Empty

const trisLines = [
  # horizontal
  [NW, N, NE],
  [W, C, E],
  [SW, S, SE],
  # vertical
  [NW, W, SW],
  [N, C, S],
  [NE, E, SE],
  # diagonal
  [NW, C, SE],
  [NE, C, SW],
]

func isPlayable*(game: Grid): bool =
  for pos in Position:
    if game[pos] == Empty:
      return true
  false

func status*(game: Grid): Outcome =
  # check for tris
  for line in trisLines:
    case game.isTris(line)
    of Empty:
      continue
    of X:
      return trisX
    of O:
      return trisO

  if game.isPlayable:
    ongoing
  else:
    draw

template playGeneric(player: Player, mark: Cell, resign: Outcome, move: var Move) =
  let name = player.name
  # papercut: strformat awkward to use in templates: https://nim-lang.org/docs/strformat.html#limitations
  echo "Player " & name & " to move:"
  echo game
  move = player.play game
  if move.isNone:
    echo fmt"Player " & name & " resigns!"
    return resign
  else:
    let pos = move.get()
    doAssert game.isAvailable pos, fmt"position " & $pos & " not available in game:\n" & $game
    game[pos] = mark
    echo fmt"Player " & name & " moves in " & $pos & ":"
    echo game

proc playGame*(playerX: Player, playerO: Player): Outcome =
  var game = newGame()
  echo fmt"New Game between {playerX.name} (X) and {playerO.name} (O):"
  echo game
  var
    playX = true  # X goes first by default
    move: Move
  while true:
    if playX:
      playGeneric(playerX, X, resignX, move)
      playX = false
    else:
      playGeneric(playerO, O, resignO, move)
      playX = true

when isMainModule:
  let
    playerX = SequentialPlayer(
      name: "X",
      moves: @[C,   E,  S,  NW,]
    )
    playerO = SequentialPlayer(
      name: "O",
      moves: @[  NE,  W,  N,   SE,]
    )
  let outcome = playGame(playerX, playerO)
  echo outcome