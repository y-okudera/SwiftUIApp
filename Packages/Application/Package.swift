// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Application",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "Application",
            targets: ["Application"]
        ),
    ],
    dependencies: [
        .package(name: "Injected", path: "../Injected"),
        .package(name: "Domain", path: "../Domain"),
        .package(name: "Infrastructure", path: "../Infrastructure"),
    ],
    targets: [
        .target(
            name: "Application",
            dependencies: [
                .product(name: "Injected", package: "Injected"),
                .product(name: "Domain", package: "Domain"),
                .product(name: "Infrastructure", package: "Infrastructure"),
            ]
        ),
        .testTarget(
            name: "ApplicationTests",
            dependencies: ["Application"]
        ),
    ]
)
