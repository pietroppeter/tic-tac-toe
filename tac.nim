when isMainModule:
  import games, human
  let
    playerX = newHumanPlayer(X)
    playerO = newHumanPlayer(O)
  var game = newGame(playerX, playerO)
  playFull game
  echo game.status
