// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let alfredResult = try? newJSONDecoder().decode(AlfredResult.self, from: jsonData)
//   let alfredItem = try? newJSONDecoder().decode(AlfredItem.self, from: jsonData)
//   let alfredIcon = try? newJSONDecoder().decode(AlfredIcon.self, from: jsonData)
//   let alfredVariables = try? newJSONDecoder().decode(AlfredVariables.self, from: jsonData)

import Foundation

// MARK: - AlfredResult
struct AlfredResult: Codable {
  /// A Script Filter is required to return an items array of zero or more `items`. Each `item`
  /// describes a result row displayed in Alfred.
  let items: [AlfredItem]
  /// Scripts can be set to re-run automatically after an interval using the 'rerun' key with a
  /// value of 0.1 to 5.0 seconds. The script will only be re-run if the script filter is still
  /// active and the user hasn't changed the state of the filter by typing and triggering a
  /// re-run.
  ///
  /// See the built in "Advanced Script Filter" getting started guide for more info, and to see
  /// this in practice.
  let rerun: Double?
  /// Variables can be passed out of the script filter within a `variables` object. This is
  /// useful for two things. Firstly, these variables will be passed out of the script filter's
  /// outputs when actioning a result. Secondly, any variables passed out of a script will be
  /// passed back in as environment variables when the script is run within the same session.
  /// This can be used for very simply managing state between runs as the user types input or
  /// when the script is set to re-run after an interval.
  ///
  /// See the built in "Advanced Script Filter" getting started guide for more info, and to see
  /// this in practice.
  let variables: [String: String]?
}

// MARK: - AlfredItem
struct AlfredItem: Codable {
  /// The argument which is passed through the workflow to the connected output action.
  ///
  /// While the arg attribute is optional, it's highly recommended that you populate this as
  /// it's the string which is passed to your connected output actions. If excluded, you won't
  /// know which result item the user has selected.
  let arg: String?
  /// An optional but recommended string you can provide which is populated into Alfred's
  /// search field if the user auto-complete's the selected result (⇥ by default).
  ///
  /// If the `item` is set as `"valid": false`, the auto-complete text is populated into
  /// Alfred's search field when the user actions the result.
  let autocomplete: String?
  /// The icon displayed in the result row. Workflows are run from their workflow folder, so
  /// you can reference icons stored in your workflow relatively.
  ///
  /// By omitting the `type`, Alfred will load the file path itself, for example a png. By
  /// using `"type": "fileicon"`, Alfred will get the icon for the specified path. Finally, by
  /// using `"type": "filetype"`, you can get the icon of a specific file, for example `"path":
  /// "public.png"`.
  let icon: AlfredIcon
  /// From Alfred 3.5, the `match` field enables you to define what Alfred matches against when
  /// the workflow is set to "Alfred Filters Results". If `match` is present, it fully replaces
  /// matching on the title property.
  ///
  /// Note that the `match` field is always treated as case insensitive, and intelligently
  /// treated as diacritic insensitive. If the search query contains a diacritic, the match
  /// becomes diacritic sensitive.
  ///
  /// This option pairs well with the ["Alfred Filters Results" Match
  /// Mode](https://www.alfredapp.com/help/workflows/inputs/script-filter/#alfred-filters-results)
  /// option.
  let match: String?
  /// The mod element gives you control over how the modifier keys react. You can now define
  /// the valid attribute to mark if the result is **valid** based on the modifier selection
  /// and set a different **arg** to be passed out if actioned with the modifier.
  ///
  /// From Alfred 3.4.1, you can define an `icon` and `variables` for each object in the mods
  /// object.
  ///
  /// See [Variables / Session
  /// Variables](https://www.alfredapp.com/help/workflows/inputs/script-filter/json/#variables)
  /// for more info about using variables.
  let mods: Mods?
  /// A Quick Look URL which will be visible if the user uses the Quick Look feature within
  /// Alfred (tapping shift, or cmd+y). Note that quicklookurl will also accept a file path,
  /// both absolute and relative to home using ~/.
  let quicklookurl: String?
  /// The subtitle displayed in the result row. This element is optional.
  let subtitle: String?
  /// The text element defines the text the user will get when copying the selected result row
  /// with ⌘C or displaying large type with ⌘L.
  ///
  /// If these are not defined, you will inherit Alfred's standard behaviour where the arg is
  /// copied to the Clipboard or used for Large Type.
  let text: Text?
  /// The title displayed in the result row. There are no options for this element and it is
  /// essential that this element is populated.
  let title: String
  /// By specifying `"type": "file"`, this makes Alfred treat your result as a file on your
  /// system. This allows the user to perform actions on the file like they can with Alfred's
  /// standard file filters.
  ///
  /// When returning files, Alfred will check if the file exists before presenting that result
  /// to the user. This has a very small performance implication but makes the results as
  /// predictable as possible. If you would like Alfred to skip this check as you are certain
  /// that the files you are returning exist, you can use `"type": "file:skipcheck"`.
  let type: AlfredItemType?
  /// This is a unique identifier for the item which allows help Alfred to learn about this
  /// item for subsequent sorting and ordering of the user's actioned results.
  ///
  /// It is important that you use the same UID throughout subsequent executions of your script
  /// to take advantage of Alfred's knowledge and sorting. If you would like Alfred to always
  /// show the results in the order you return them from your script, exclude the UID field.
  let uid: String?
  /// If this item is valid or not.If an `item` is valid then Alfred will action this item when
  /// the user presses return. If the `item` is not valid, Alfred will do nothing. This allows
  /// you to intelligently prevent Alfred from actioning a result based on the current
  /// `{query}` passed into your script.
  ///
  /// If you exclude the valid attribute, Alfred assumes that your `item` is valid.
  let valid: Bool?
  /// From Alfred 3.4.1, individual `item` objects can also have `variables` which are passed
  /// out of the Script Filter object if the associated Result Item is selected in Alfred's
  /// results list. `variables` set within an `item` will override any JSON session variables
  /// of the same name.
  let variables: [String: String]?
}

/// The icon displayed in the result row. Workflows are run from their workflow folder, so
/// you can reference icons stored in your workflow relatively.
///
/// By omitting the `type`, Alfred will load the file path itself, for example a png. By
/// using `"type": "fileicon"`, Alfred will get the icon for the specified path. Finally, by
/// using `"type": "filetype"`, you can get the icon of a specific file, for example `"path":
/// "public.png"`.
// MARK: - AlfredIcon
struct AlfredIcon: Codable {
  let path: String
  let type: AlfredIconType?
}

enum AlfredIconType: String, Codable {
  case fileicon = "fileicon"
  case filetype = "filetype"
}

/// The mod element gives you control over how the modifier keys react. You can now define
/// the valid attribute to mark if the result is **valid** based on the modifier selection
/// and set a different **arg** to be passed out if actioned with the modifier.
///
/// From Alfred 3.4.1, you can define an `icon` and `variables` for each object in the mods
/// object.
///
/// See [Variables / Session
/// Variables](https://www.alfredapp.com/help/workflows/inputs/script-filter/json/#variables)
/// for more info about using variables.
// MARK: - Mods
struct Mods: Codable {
  let alt: Mod?
  let cmd: Mod?
  let shift: Mod?
}

// MARK: - Mod
struct Mod: Codable {
  let arg: String?
  let icon: AlfredIcon?
  let subtitle: String?
  let valid: Bool?
  /// It is also possible to set additional variables for each `mod` object within an `item`.
  /// `variables` set for a `mod` will override any `item` variables of the same name.
  let variables: [String: String]?
}

/// The text element defines the text the user will get when copying the selected result row
/// with ⌘C or displaying large type with ⌘L.
///
/// If these are not defined, you will inherit Alfred's standard behaviour where the arg is
/// copied to the Clipboard or used for Large Type.
// MARK: - Text
struct Text: Codable {
  let copy, largetype: String?
}

/// By specifying `"type": "file"`, this makes Alfred treat your result as a file on your
/// system. This allows the user to perform actions on the file like they can with Alfred's
/// standard file filters.
///
/// When returning files, Alfred will check if the file exists before presenting that result
/// to the user. This has a very small performance implication but makes the results as
/// predictable as possible. If you would like Alfred to skip this check as you are certain
/// that the files you are returning exist, you can use `"type": "file:skipcheck"`.
enum AlfredItemType: String, Codable {
  case file = "file"
  case fileSkipcheck = "file:skipcheck"
  case typeDefault = "default"
}

typealias AlfredVariables = [String: String]
