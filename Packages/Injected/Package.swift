// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Injected",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "Injected",
            targets: ["Injected"]
        ),
    ],
    dependencies: [

    ],
    targets: [
        .target(
            name: "Injected",
            dependencies: []
        ),
        .testTarget(
            name: "InjectedTests",
            dependencies: ["Injected"]
        ),
    ]
)
