import Foundation
import SoulverCore

actor CurrencyRefresher {
  private init() {
    do {
      try CurrencyList.shared.loadCurrenciesFrom(url: CurrencyDataURL)
    } catch {}
  }
  static let shared = CurrencyRefresher()

  enum Error: Swift.Error {
    case errorRefreshingCurrency
  }

  func refreshIfNeeded() async throws {
    if await PreferencesManager.shared.needsRefresh() {
      try await refresh()
    }
  }

  func refresh() async throws {
    CurrencyList.shared.defaultCurrencySet = .popular
    try await withCheckedThrowingContinuation { (c: CheckedContinuation<Void, Swift.Error>) in
      CurrencyList.shared.refreshRates { success in
        if success {
          c.resume(returning: ())
        } else {
          c.resume(throwing: Error.errorRefreshingCurrency)
        }
      }
    }
    try FileManager.default.createDirectory(
      at: CurrencyDataURL.deletingLastPathComponent(), withIntermediateDirectories: true)
    CurrencyList.shared.saveCurrenciesTo(url: CurrencyDataURL)
    await PreferencesManager.shared.markRefreshed()
  }
}
