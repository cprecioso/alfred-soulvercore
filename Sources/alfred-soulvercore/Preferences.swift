import Foundation

actor PreferencesManager {
  static var shared = try! PreferencesManager()
  private init() throws {
    manager = try DataFileManager<Value>(fileURL: PreferencesDataURL, fallback: Value())
  }

  private let manager: DataFileManager<Value>

  struct Value: Codable {
    var lastRefresh: Date?
    var updatePeriod: TimeInterval = 60 * 60 * 24  // 1 day in seconds
  }

  func needsRefresh(now: Date = Date()) async -> Bool {
    guard let lastRefresh = await manager.current.lastRefresh else {
      return true
    }

    let updatePeriod = await manager.current.updatePeriod

    return (lastRefresh + updatePeriod) <= now
  }

  func markRefreshed(now: Date = Date()) async {
    await manager.update { $0.lastRefresh = now }
  }
}
