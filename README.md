# tac

a terminal based tic-tac-toe for my Recurse Center application

modules:
- `tac`: cli to play the game, two humans against each other
- `game`: implements game logic
  - game logic is tested using sequential players and a utility module called `diagrams`
- `grid`: provides basic functionality to manipulate and render the grid and to check if there are winning positions
- `players`: defines a `Player` base object and provides
  - a sequential player with predefined moves
  - a human player which prompts user for next move
- `prompts`: functionalities to prompt users

roadmap:
- [ ] ai players
  - [ ] a simple `RandomPlayer`
  - [ ] a generic rule based AI player `RulesPlayer`
  - [ ] MENACE
- [ ] tac: prompt to choose players (human, ai)
