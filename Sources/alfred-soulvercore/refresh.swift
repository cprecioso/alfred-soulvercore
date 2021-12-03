import Foundation
import SoulverCore

func refreshIfNeeded(completionHandler: @escaping (() -> Void)) {
  let lastRefresh = loadData()
  let nextRefresh = lastRefresh.addingTimeInterval(UpdatePeriod)
  let currentDate = Date()

  if nextRefresh < currentDate {
    refresh { result in
      if result {
        saveData()
      }
      completionHandler()
    }
  } else {
    completionHandler()
  }
}

func refresh(completionHandler: @escaping ((Bool) -> Void)) {
  CurrencyList.shared.defaultCurrencySet = .popular
  CurrencyList.shared.refreshRates(completionHandler: completionHandler)
}

func loadData() -> Date {
  var returnDate: Date? = nil

  if let url = CurrencyDataURL,
    (try? CurrencyList.shared.loadCurrenciesFrom(url: url)) != nil
  {
    returnDate = userDefaults.object(forKey: LastRefreshKey) as? Date
  }

  return returnDate ?? Date.distantPast
}

func saveData() {
  if let url = CurrencyDataURL,
    (try? FileManager.default.createDirectory(
      at: url.deletingLastPathComponent(), withIntermediateDirectories: true)) != nil
  {
    CurrencyList.shared.saveCurrenciesTo(url: url)
    userDefaults.set(Date(), forKey: LastRefreshKey)
  }
}
