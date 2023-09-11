import std / options
import grid

type
  Player* = ref object of RootObj
    mark: Mark
  SequentialPlayer* = ref object of Player
    moves: seq[Position]
  OptMove* = Option[Move]

func newSeqPlayerX*(moves: seq[Position]): SequentialPlayer =
  SequentialPlayer(mark: X, moves: moves)

func newSeqPlayerO*(moves: seq[Position]): SequentialPlayer =
  SequentialPlayer(mark: O, moves: moves)

method play*(p: Player, g: Grid): OptMove {. base .} = 
  raise newException(CatchableError, "Method without implementation override")

method play*(p: SequentialPlayer, g: Grid): OptMove =
  for move in p.moves:
    if g.isAvailable (p.mark, move):
      return some((p.mark, move))
  none(Move)

when isMainModule:
  let
    playerX = newSeqPlayerX(@[q,s,a,z])
    playerO = newSeqPlayerO(@[ w,c,d])
  var g = newGrid()
  echo g
  var optMove = playerX.play g
  var playX = false
  while optMove.isSome:
    let move = optMove.get
    echo "move: ", move
    g.update move
    echo g
    if playX:
      optMove = playerX.play g
      playX = false
    else:
      optMove = playerO.play g
      playX = true

