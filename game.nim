import grid, players

type
  Game* = object
    grid: Grid
    playerX, playerO: Player
    playX: bool
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