// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "vox",
    platforms: [
        .iOS(.v14),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "voxAgent",
            targets: ["voxAgent"]
        ),
        .library(
            name: "vox",
            targets: ["vox"]
        ),
        .executable(
            name: "voxDemo",
            targets: ["voxDemo"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/daltoniam/Starscream.git",
            from: "4.0.8"
        ),
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture.git",
            from: "1.17.1"
        )
    ],
    targets: [
        .target(
            name: "voxAgent",
            dependencies: [
                .product(name: "Starscream", package: "Starscream")
            ]
        ),
        .target(
            name: "vox",
            dependencies: [
                "voxAgent",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ],
            resources: [
                .process("Resources")
            ],
            swiftSettings: [
                .unsafeFlags(["-Xfrontend", "-disable-availability-checking"])
            ]
        ),
        .executableTarget(
            name: "voxDemo",
            dependencies: ["voxAgent"]
        )
    ]
)
