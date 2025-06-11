
// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "FinalPack",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "FinalPack",
            targets: ["FinalPack"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/MmikeDonahue/MikeUI.git", from: "1.0.0"),
        .package(url: "https://github.com/MmikeDonahue/MikeCore.git", from: "1.0.0"),
        .package(url: "https://github.com/MmikeDonahue/MikeFoundation.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "FinalPack",
            dependencies: [
                .product(name: "MikeUI", package: "MikeUI"),
                .product(name: "MikeCore", package: "MikeCore"),
                .product(name: "MikeFoundation", package: "MikeFoundation"),
            ]
        ),
        .testTarget(
            name: "FinalPackTests",
            dependencies: ["FinalPack"]
        ),
    ]
)