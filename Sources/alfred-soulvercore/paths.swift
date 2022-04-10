import Foundation

let CacheFolderURL = URL(
  fileURLWithPath: ProcessInfo.processInfo.environment["alfred_workflow_cache"]!)
let DataFolderURL = URL(
  fileURLWithPath: ProcessInfo.processInfo.environment["alfred_workflow_data"]!)

let PreferencesDataURL = DataFolderURL.appendingPathComponent("preferences.json")
let CurrencyDataURL = CacheFolderURL.appendingPathComponent("currencies.json")
