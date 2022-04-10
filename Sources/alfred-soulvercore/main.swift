import SoulverCore

Task {
  try await CurrencyRefresher.shared.refreshIfNeeded()
  print(calc())
  exit(0)
}

RunLoop.current.run()

func calc() -> String {
  let input = CommandLine.arguments.dropFirst().joined(separator: " ")
  let calculator = Calculator(customization: .standard)
  let result = calculator.calculate(input).stringValue

  let alfredResult = AlfredResult(
    items: [
      AlfredItem(
        arg: result,
        autocomplete: nil,
        icon: AlfredIcon(path: "./icon.png", type: nil),
        match: nil,
        mods: nil,
        quicklookurl: nil,
        subtitle: "Action this item to copy this result to the clipboard",
        text: Text(copy: result, largetype: result),
        title: result,
        type: .typeDefault,
        uid: nil,
        valid: true,
        variables: nil)
    ],
    rerun: nil,
    variables: nil)

  let data = try! JSONEncoder().encode(alfredResult)

  return String(data: data, encoding: .utf8)!
}
