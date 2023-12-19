// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "ApplicationKit",
    platforms: [
        .iOS(.v15),
        .watchOS(.v8),
        .macOS(.v11),
        .tvOS(.v15)
    ],
    products: [
        .library(
            name: "ApplicationKit",
            targets: ["ApplicationKit"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/0xLeif/AppState", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "ApplicationKit",
            dependencies: ["AppState"]
        ),
        .testTarget(
            name: "ApplicationKitTests",
            dependencies: ["ApplicationKit"]
        )
    ]
)
