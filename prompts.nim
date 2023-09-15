import std / [rdstdin, strutils]

const prompt = "> "

proc genericPrompt*(
  question: string,
  validInputs: seq[string],
  onInvalidInput: string
): string =
  ## generic prompt (input is stripped and lowercased)
  var invalidInput = false
  while true:
    if invalidInput:
      echo onInvalidInput
    echo question
    let ok = readLineFromStdin(prompt, result)
    # ctrl-C or ctrl-D will cause the program to terminate
    if not ok: quit()
    result = result.strip.toLowerascii
    if result in validInputs:
      break
    else:
      invalidInput = true

proc yes*(question = ""): bool =
  ## empty string defaults to yes
  let answer = genericPrompt(
    question = question & " (Y/n)",
    validInputs = @["", "y", "n"],
    onInvalidInput = "please reply 'y' or 'n'"
  )
  result = answer in @["", "y"]

when isMainModule:
  if "ready?".yes:
    echo "you said yes, that's good"
  else:
    echo "you said no, I like it too"
