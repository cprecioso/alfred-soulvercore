// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "alfred-soulvercore",
  platforms: [.macOS(.v10_15)],
  dependencies: [
    .package(url: "https://github.com/soulverteam/SoulverCore", from: "1.4.0")
  ],
  targets: [
    .target(
      name: "alfred-soulvercore",
      dependencies: ["SoulverCore"])
  ]
)
