todo:
- [x] grid
  - [ ] toCompactStr (for testing)
- [x] players
- [x] games
- [x] human
  - [ ] refactor into players?
- [ ] prompts
  - both for human player and for cli
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

example of target tac cli Messages:

```
---instructions.start
Welcome to TAC a game of Tic-Tac-Toe for humans!

Two players take turns placing Xs and Os in a 3x3 grid.
The first who places three-in-a-row wins!

To input each move you use the following letters

q│w│e
─┼─┼─
a│s│d
─┼─┼─
z│x│c

You can resign (and lose the game) using `r`.
---instructions.end
---prompt.ready
Ready to start? (Y/n)
> 
---if no
That's fine, take your time and come back when you are ready!
---exit
---if yes:
---first move

 │ │ 
─┼─┼─
 │ │ 
─┼─┼─
 │ │ 
X to move:
>
```
