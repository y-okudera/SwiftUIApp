// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Presentation",
    defaultLocalization: "ja",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "Presentation",
            targets: ["Presentation"]
        ),
    ],
    dependencies: [
        .package(name: "Injected", path: "../Injected"),
        .package(name: "Domain", path: "../Domain"),
        .package(name: "Application", path: "../Application"),
    ],
    targets: [
        .target(
            name: "Presentation",
            dependencies: [
                .product(name: "Injected", package: "Injected"),
                .product(name: "Domain", package: "Domain"),
                .product(name: "Application", package: "Application"),
            ]
        ),
        .testTarget(
            name: "PresentationTests",
            dependencies: ["Presentation"]
        ),
    ]
)
