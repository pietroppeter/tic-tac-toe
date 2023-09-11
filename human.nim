import std/[rdstdin, strformat, sequtils, strutils]
import players, grid

type
  HumanPlayer* = ref object of Player

func newHumanPlayer*(mark: Mark): HumanPlayer =
  assert mark in [X, O]
  HumanPlayer(mark: mark)

proc inputOptPos*(options: seq[Position]): Option[Position] =
  let validInputs = options.mapIt($it)
  var line: string
  var invalidInput = false
  while true:
    if invalidInput:
      echo "Please type `r` (resign) or one of the following: " & validInputs.join(",")
    let ok = readLineFromStdin(fmt"Your move: ", line)
    # ctrl-C or ctrl-D will cause the program to terminate
    if not ok: quit()
    if line == "r" or line in validInputs:
      break
    else:
      invalidInput = true
  if line == "r":
    none(Position)
  else:
    some(parseEnum[Position](line))
  
method play*(p: HumanPlayer, g: Grid): OptMove = 
  let availablePositions = g.availablePositions
  let optPos = inputOptPos(availablePositions)
  if optPos.isNone:
    none(Move)
  else:
    some (mark: p.mark, pos: optPos.get)

when isMainModule:
  import games
  let
    playerX = newSeqPlayer(X, @[q,w,e,a,s,d,z,x,c])
    playerO = newHumanPlayer(O)
  var game = newGame(playerX, playerO)
  playFull game
  echo game.status

  # test with `cat human_seq_game.txt | nim r human`
  assert game.status == winO
