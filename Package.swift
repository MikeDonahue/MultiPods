// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MultiPods",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MikeFoundation",
            targets: ["MikeFoundation"]),
        .library(
            name: "MikeCore",
            targets: ["MikeCore"]),
        .library(
            name: "MikeUI",
            targets: ["MikeUI"]),
        .library(
            name: "MikeBundled",
            targets: ["MikeFoundation", "MikeCore", "MikeUI"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.

        // Foundation
        .target(
            name: "MikeFoundation"),
            path: "MikeFoundation/MikeFoundation/",
        .testTarget(
            name: "MikeFoundationTests",
            path: "MikeFoundation/MikeFoundationTests/",
        
        // Core
        .target(
            name: "MikeCore"),
            dependencies: ["MikeFoundation"],
            path: "MikeCore/MikeCore/",
        .testTarget(
            name: "MikeCoreTests",
            dependencies: ["MikeFoundation"],
            path: "MikeCore/MikeCoreTests/",

        // UI
        .target(
            name: "MikeUI"),
            dependencies: ["MikeFoundation", "MikeCore"],
            path: "MikeUI/MikeUI/",
        .testTarget(
            name: "MikeUITests",
            dependencies: ["FirebaseAnalyticsSwift", "MikeCore"],
            path: "MikeUI/MikeUITests/",
    ]
)
