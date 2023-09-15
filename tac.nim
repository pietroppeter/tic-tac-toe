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

when isMainModule:
  import games, human

  echo welcomeMessage
  echo inputInstructions

  let
    playerX = newHumanPlayer(X)
    playerO = newHumanPlayer(O)
  var game = newGame(playerX, playerO)
  playFull game
  echo game.status
