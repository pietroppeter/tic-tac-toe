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
---welcome
Welcome to TAC a game of Tic-Tac-Toe for humans!

Two players take turns placing Xs and Os in a 3x3 grid.
The first who places three-in-a-row wins!

---input instructions
To input each move you use the following letters

q│w│e
─┼─┼─
a│s│d
─┼─┼─
z│x│c

You can also resign (and lose the game) using `r`.

---prompt.ready
Ready to start? (Y/n)
> 
---prompt.ready.no
That's fine, take your time and come back when you are ready!
-> quit
---prompt.ready.invalidInput
please answer yes (Y/y) or no (N/n)
---prompt.ready.yes
---game.play

 │ │ 
─┼─┼─
 │ │ 
─┼─┼─
 │ │ 
---human.prompt.move
X to move:
>
---human.prompt.move.q

X│ │ 
─┼─┼─
 │ │ 
─┼─┼─
 │ │ 
---human.prompt.move
O to move:
>
---human.prompt.move.invalid
`..` is not a valid input, sorry.
---repeat instructions basing them on current game
The lower case letters here are the current valid inputs

X│w│e
─┼─┼─
a│s│d
─┼─┼─
z│x│c  (r to resign)
---human.prompt
O to move:
>
---


```
