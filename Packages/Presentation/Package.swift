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
        )
    ],
    dependencies: [
        .package(name: "AppCore", path: "../AppCore"),
        .package(name: "UseCase", path: "../UseCase"),
        .package(url: "https://github.com/onevcat/Kingfisher", from: "6.3.1"),
    ],
    targets: [
        .target(
            name: "Presentation",
            dependencies: [
                .product(name: "AppCore", package: "AppCore"),
                .product(name: "UseCase", package: "UseCase"),
                .product(name: "Kingfisher", package: "Kingfisher"),
            ]
        ),
        .testTarget(
            name: "PresentationTests",
            dependencies: ["Presentation"]
        ),
    ]
)
