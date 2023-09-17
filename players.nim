import std / [options, sequtils, strformat, strutils, random]
import grid, prompts
export options

type
  Player* = ref object of RootObj
    mark*: Mark
  SequentialPlayer* = ref object of Player
    moves*: seq[Position]
  HumanPlayer* = ref object of Player
  RandomPlayer* = ref object of Player
  OptMove* = Option[Move]

func newSeqPlayer*(mark: Mark, moves: seq[Position]): SequentialPlayer =
  doAssert mark in [X, O]
  SequentialPlayer(mark: mark, moves: moves)

func newHumanPlayer*(mark: Mark): HumanPlayer =
  doAssert mark in [X, O]
  HumanPlayer(mark: mark)

func newRandomPlayer*(mark: Mark): RandomPlayer =
  doAssert mark in [X, O]
  RandomPlayer(mark: mark)

method play*(p: Player, g: Grid): OptMove {. base .} = 
  raise newException(CatchableError, "Method without implementation override")

method play*(p: SequentialPlayer, g: Grid): OptMove =
  for move in p.moves:
    if g.isAvailable (p.mark, move):
      return some((p.mark, move))
  none(Move)

method play*(p: RandomPlayer, g: Grid): OptMove =
  if g.availablePositions.len == 0:
    none(Move)
  else:
    some((p.mark, g.availablePositions.sample))

proc inputOptPos*(options: seq[Position], mark: Mark): Option[Position] =
  let
    validInputs = options.mapIt($it) & @["r"]
    onInvalidInput = "Please type `r` (resign) or one of the following: " & validInputs.join(",")
  let answer = genericPrompt(
    question = fmt"Your move ({mark}):",
    validInputs,
    onInvalidInput,
  )
  if answer == "r":
    none(Position)
  else:
    some(parseEnum[Position](answer))
  
method play*(p: HumanPlayer, g: Grid): OptMove = 
  let availablePositions = g.availablePositions
  let optPos = inputOptPos(availablePositions, p.mark)
  if optPos.isNone:
    none(Move)
  else:
    some (mark: p.mark, pos: optPos.get)

when isMainModule:
  block:
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
  # test with `cat test_game_players_human_input.txt | nim r players`
  # or winO with s, e, z
  import games

  block:
    let
      playerX = newSeqPlayer(X, @[q,w,e,a,s,d,z,x,c])
      playerO = newHumanPlayer(O)
    var game = newGame(playerX, playerO)
    playFull game
    echo game.status

    assert game.status == winO
