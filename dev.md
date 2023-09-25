todo:
- [x] grid
  - [ ] toCompactStr (for testing)
- [x] players
- [x] games
- [x] human
  - [x] refactor into players
- [x] prompts
  - both for human player and for cli
- [x] tac: the cli. two humans play against each other
  - [x] improve messages
    - [x] welcome message
    - [x] input instructinos
    - [x] ready to start
    - [x] end game message
  - [x] allow replay
- [x] clean up, review README and comment
  - [x] add selected roadmap elements to README
- [x] bug not showing last step

nice to haves:
- [x] diagrams module for testing game logic
- [x] better ascii representation of grid
- [x] clean nim cfg for nim r with clean output

roadmap:
- [ ] ai players
  - generic rule based ai is a sequence of players!
- [ ] MENACE!
  - [ ] will require some storage mechanism
- [ ] implement tournaments
- [ ] add a moves field to Game to record all moves? (allows undo and saving)
- [ ] terminal effects? (bold, colors, blinking)
  - [ ] colored Xs and Os
  - [ ] highlight lastmove (bold?)
  - [ ] blinking winning row?
- [ ] separate log/prompt module for messages
- [ ] web interface (with nimib and karax/happyx?)
- [ ] documents (with nimib)
  - [ ] example play
  - [ ] reports on tournaments between ai players
  - [ ] how menace learns
