import std / options
import grid
export options

type
  Player* = ref object of RootObj
    mark*: Mark
  SequentialPlayer* = ref object of Player
    moves: seq[Position]
  OptMove* = Option[Move]

func newSeqPlayer*(mark: Mark, moves: seq[Position]): SequentialPlayer =
  doAssert mark in [X, O]
  SequentialPlayer(mark: mark, moves: moves)

method play*(p: Player, g: Grid): OptMove {. base .} = 
  raise newException(CatchableError, "Method without implementation override")

method play*(p: SequentialPlayer, g: Grid): OptMove =
  for move in p.moves:
    if g.isAvailable (p.mark, move):
      return some((p.mark, move))
  none(Move)

when isMainModule:
  let
    playerX = newSeqPlayer(X, @[q,s,a,z])
    playerO = newSeqPlayer(O, @[ w,c,d])
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
