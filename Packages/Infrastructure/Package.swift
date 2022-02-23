// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Infrastructure",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "Infrastructure",
            targets: ["Infrastructure"]
        ),
    ],
    dependencies: [
        .package(name: "Injected", path: "../Injected"),
        .package(name: "Domain", path: "../Domain"),
        .package(url: "https://github.com/carson-katri/swift-request", from: "1.4.0"),
    ],
    targets: [
        .target(
            name: "Infrastructure",
            dependencies: [
                .product(name: "Injected", package: "Injected"),
                .product(name: "Domain", package: "Domain"),
                .product(name: "Request", package: "swift-request"),
                .product(name: "Json", package: "swift-request"),
            ]
        ),
        .testTarget(
            name: "InfrastructureTests",
            dependencies: ["Infrastructure"]
        ),
    ]
)
