// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "WithBinding",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "WithBinding",
            targets: ["WithBinding"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WithBinding",
            dependencies: []),
        .testTarget(
            name: "WithBindingTests",
            dependencies: ["WithBinding"]),
    ]
)
