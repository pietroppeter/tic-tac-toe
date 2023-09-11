import grid
import std / options

type
  Diagram* = distinct string
  ParseOutput = array[0 .. 8, Option[int]]

const
  non = none(int)

func o(n: int): Option[int] = some(n)
func x(n: int): Option[int] = some(n)

func parse(d: Diagram): ParseOutput =
  let d = d.string
  var i = 0
  var pos = 0
  while pos < 9 and i < d.len:
    case d[i]
    of '.':
      result[pos] = non
      inc pos
    of '1' .. '9':
      result[pos] = some(ord(d[i]) - ord('0'))
      inc pos
    else:
      discard
    inc i

when isMainModule:
  let d1 = """
    12.
    536
    7.4""".Diagram
  let p1 = [
    x 1, o 2, non,
    x 5, x 3, o 6,
    x 7, non, o 4,
  ]
  assert d1.parse == p1

  let d2 = """
    672
    314
    985""".Diagram
  let p2 = [
    o 6, x 7, o 2,
    x 3, x 1, o 4,
    x 9, o 8, x 5,
  ]
  assert d2.parse == p2
