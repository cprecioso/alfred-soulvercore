//
//  main.swift
//  alfred-soulvercore
//
//  Created by Carlos Precioso on 21/10/2020.
//

import SoulverCore

refreshIfNeeded {
  print(calc() ?? "")
  exit(0)
}

RunLoop.current.run()

func calc() -> String? {
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

  guard let data = try? JSONEncoder().encode(alfredResult) else { return nil }

  return String(data: data, encoding: .utf8)
}
