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
  - [ ] improve messages
    - [x] welcome message
    - [x] input instructinos
    - [x] ready to start
    - [ ] end game message
  - [ ] allow replay
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
