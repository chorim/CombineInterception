// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CombineInterception",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(name: "CombineInterception", targets: ["CombineInterception"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "CombineInterception", dependencies: ["CombineInterceptionObjC"]),
        .target(name: "CombineInterceptionObjC", dependencies: [])
    ]
)
