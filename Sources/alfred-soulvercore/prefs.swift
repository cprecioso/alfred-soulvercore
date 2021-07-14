import Foundation

let BundleIdentifier = "design.precioso.alfred-soulvercore"

let userDefaults = UserDefaults(suiteName: BundleIdentifier)!

let cacheFolder = try? FileManager.default.url(
  for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true
).appendingPathComponent(BundleIdentifier)

let LastRefreshKey = "last-refresh"
let UpdatePeriod: TimeInterval = 60 * 60 * 24  // 1 day in seconds
let CurrencyDataURL = cacheFolder?.appendingPathComponent("currencies.json")
