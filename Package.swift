import PackageDescription

// swift-tools-version:5.10

let package = Package(
    name: "FinalPack",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "FinalPack",
            targets: ["FinalPack"]),
    ],
    dependencies: [
        .package(path: "../UI"),
        .package(path: "../Core"),
        .package(path: "../Foundation"),
    ],
    targets: [
        .target(
            name: "FinalPack",
            dependencies: ["UI", "Core", "Foundation"]),
        .testTarget(
            name: "FinalPackTests",
            dependencies: ["FinalPack"]),
    ]
)