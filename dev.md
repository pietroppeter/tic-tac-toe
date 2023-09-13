todo:
- [x] grid
  - [ ] toCompactStr (for testing)
- [x] players
- [x] games
- [x] human
  - [ ] refactor into players?
  - [ ] separate prompt module?
- [x] tac: the cli. two humans play against each other
  - [ ] improve messages
  - [ ] allow replay
  - [ ] keep scores
- [ ] clean up, review README and comment
  - [ ] add selected roadmap elements to README

nice to haves:
- [x] diagrams module for testing game logic
- [x] better ascii representation of grid
- [ ] clean nim cfg for nim r with clean output

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
