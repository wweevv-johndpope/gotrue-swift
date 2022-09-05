// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "GoTrue",
  platforms: [
    .iOS(.v13),
    .macCatalyst(.v13),
    .macOS(.v10_15),
    .watchOS(.v6),
    .tvOS(.v13),
  ],
  products: [
    .library(name: "GoTrue", targets: ["GoTrue"])
  ],
  dependencies: [
    .package(url: "https://github.com/WeTransfer/Mocker", from: "2.7.0"),
    .package(url: "https://github.com/binaryscraping/swift-composable-keychain", from: "0.0.2"),
    .package(url: "https://github.com/kean/Get", from: "2.0.0"),
    .package(url: "https://github.com/wweevv-johndpope/URLQueryEncoderKit", from: "0.2.2")
  ],
  targets: [
    .target(
      name: "GoTrue",
      dependencies: [
        .product(name: "Get", package: "Get"),
        .product(name: "ComposableKeychain", package: "swift-composable-keychain"),
        .product(name: "URLQueryEncoderKit", package: "URLQueryEncoderKit"),
      ]
    ),
    .testTarget(
      name: "GoTrueTests",
      dependencies: [
        "GoTrue",
        "Mocker",
      ],
      resources: [
        .process("Resources")
      ]
    ),
  ]
)
