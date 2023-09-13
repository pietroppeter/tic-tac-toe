import std / algorithm
import games

type
  Diagram* = distinct string
  RankedPos = tuple[rank: int, pos: Position]
  ParseOutput = seq[RankedPos]

proc myCmp(r, s: RankedPos): int =
  cmp(r.rank, s.rank)

func parse(d: Diagram): ParseOutput =
  let d = d.string
  var i = 0
  var pos = 0
  while pos < 9 and i < d.len:
    case d[i]
    of '.':
      inc pos
    of '1' .. '9':
      result.add ((ord(d[i]) - ord('0')), Position(pos))
      inc pos
    else:
      discard
    inc i
  sort(result, myCmp)

func newGameFrom*(d: Diagram): Game =
  var
    xMoves: seq[Position]
    oMoves: seq[Position]
  for t in parse d:
    if t.rank mod 2 == 1: # first to play is X
      xMoves.add t.pos
    else:
      oMoves.add t.pos
  newGame(newSeqPlayer(X, xMoves), newSeqPlayer(O, oMoves))

when isMainModule:
  var g: Game
  let d1 = """
    12.
    536
    7.4""".Diagram
  let p1 = [(1,q),(2,w),(3,s),(4,c),(5,a),(6,d),(7,z)]
  assert d1.parse == p1

  g = newGameFrom d1
  assert SequentialPlayer(g.playerX).moves == @[q,s,a,z]
  assert SequentialPlayer(g.playerO).moves == @[w,c,d]

  let d2 = """
    672
    314
    985""".Diagram
  let p2 = [(1,s),(2,e),(3,a),(4,d),(5,c),(6,q),(7,w),(8,x),(9,z)]
  assert d2.parse == p2

  g = newGameFrom d2
  assert SequentialPlayer(g.playerX).moves == @[s, a, c, w, z]
  assert SequentialPlayer(g.playerO).moves == @[e, d, q, x]
