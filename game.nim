import grid, players

type
  Game* = object
    grid: Grid
    playerX, playerO: Player
    playX: bool
    lastMove: OptMove
    status: Status
  Status* = enum
    playing,
    draw, winX, winO,
    resignX, resignO

proc updateStatus(game: var Game) =
  case game.grid.win
  of X:
    game.status = winX
  of O:
    game.status = winO
  of empty:
    if game.grid.isPlayable:
      game.status = playing
    else:
      game.status = draw

proc newGame*(playerX, playerO: Player, playX = true): Game =
  doAssert playerX.mark == X
  doAssert playerO.mark == O
  Game(playerX: playerX, playerO: playerO, playX: playX)

proc nextMove(game: Game): OptMove =
  if game.playX:
    game.playerX.play game.grid
  else:
    game.playerO.play game.grid

proc play*(game: var Game) =
  game.lastMove = game.nextMove
  if game.lastMove.isNone:
    game.status = if game.playX: resignX else: resignO
  else:
    game.grid.update game.lastMove.get
    game.updateStatus
  # change who is playing
  if game.playX:
    game.playX = false
  else:
    game.playX = true

proc playFull*(game: var Game, verbose = true) =
  if verbose:
    echo game.grid
    echo ""

  while game.status == playing:
    game.play
    if verbose:
      echo "move: ", game.lastMove
      echo game.grid
      echo ""

when isMainModule:
  let
    playerX = newSeqPlayer(X, @[q,s,a,z])
    playerO = newSeqPlayer(O, @[ w,c,d])
  var game = newGame(playerX, playerO)
  playFull game
  echo game.status
