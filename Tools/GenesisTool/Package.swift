// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GenesisTool",
    dependencies: [
        .package(url: "https://github.com/yonaskolb/Genesis", .exact("0.6.0")),
    ],
    targets: [
        .target(name: "GenesisTool", path: ""),
    ]
)
