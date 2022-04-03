// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UseCase",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "UseCase",
            targets: ["UseCase"])
    ],
    dependencies: [
        .package(name: "AppCore", path: "../AppCore")
    ],
    targets: [
        .target(
            name: "UseCase",
            dependencies: [
                .product(name: "AppCore", package: "AppCore")
            ]
        ),
        .testTarget(
            name: "UseCaseTests",
            dependencies: ["UseCase"]
        ),
    ]
)
