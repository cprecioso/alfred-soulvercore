import Foundation

actor DataFileManager<T: Codable> {
  init(fileURL initialFileURL: URL, fallback: T) throws {
    guard initialFileURL.isFileURL else { throw Error.notFileURL }
    let fileURL = initialFileURL.standardizedFileURL
    self.fileURL = fileURL
    filePath = fileURL.path
    current = (try? Self.load(from: filePath)) ?? fallback
  }

  let fileURL: URL
  let filePath: String
  var current: T {
    didSet {
      try! save()
    }
  }

  enum Error: Swift.Error {
    case notFileURL
    case errorReadingFile
    case errorWritingFile
  }

  static func load(from filePath: String) throws -> T {
    guard let data = FileManager.default.contents(atPath: filePath) else {
      throw Error.errorReadingFile
    }
    return try JSONDecoder().decode(T.self, from: data)
  }

  func save() throws {
    let contents = try JSONEncoder().encode(current)
    try FileManager.default.createDirectory(
      at: fileURL.deletingLastPathComponent(), withIntermediateDirectories: true)
    guard FileManager.default.createFile(atPath: filePath, contents: contents) else {
      throw Error.errorWritingFile
    }
  }

  func update(_ updater: (_: inout T) throws -> Void) rethrows {
    var newValue = current
    try updater(&newValue)
    self.current = newValue
  }
}
