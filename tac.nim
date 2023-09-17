import games

let welcomeMessage* = """
Welcome to TAC, a game of Tic-Tac-Toe for humans!

Two players take turns placing Xs and Os in a 3x3 grid.
The first who places three-in-a-row wins!
"""

let inputInstructions* = """
To input each move you use the following letters

q│w│e
─┼─┼─
a│s│d
─┼─┼─
z│x│c

You can also resign (and lose the game) using `r`.
"""

func toMessage*(s: Status): string =
  case s
  of playing:
    "keep going"
  of winX:
    "X has won!"
  of winO:
    "O has won!"
  of draw:
    "it's a draw!"
  of resignX:
    "X has resigned!"
  of resignO:
    "O has resigned!"

let goodbyeMessage = "Bye, have a great day!"

when isMainModule:
  import prompts

  echo welcomeMessage
  echo inputInstructions

  var wannaPlay = "Ready to start?".yes

  while wannaPlay:
    let
      playerX = newHumanPlayer(X)
      playerO = newHumanPlayer(O)
    var game = newGame(playerX, playerO)
    playFull game

    echo ""
    echo game.status.toMessage

    echo ""
    wannaPlay = "Do you want to play again?".yes

  echo goodbyeMessage