# tac

a terminal based tic-tac-toe game for my Recurse Center application. Coded in Nim.

modules:
- `tac.nim`: cli to play the game, two humans against each other
- `game.nim`: implements game logic
  - game logic is tested using sequential players and a utility module called `diagrams.nim`
- `grid.nim`: provides basic functionality to manipulate and render the grid and to check if there are winning positions
- `players.nim`: defines a `Player` base object and provides
  - a sequential player with predefined moves
  - a human player which prompts user for next move
- `prompts.nim`: functionalities to prompt users

roadmap:
- [ ] ai players
  - [x] a simple `RandomPlayer`
  - [ ] a generic rule based AI player `RulesPlayer`
  - [ ] MENACE
- [ ] tac: prompt to choose players (human, ai)
