// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MikeFoundation",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MikeFoundation",
            targets: ["MikeFoundation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MikeFoundation"),
            dependencies: ["Alamofire"]),
        .testTarget(
            name: "MikeFoundationTests",
            dependencies: ["MikeFoundation"]),
    ]
)
