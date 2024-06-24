// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LocalCaching",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LocalCaching",
            targets: ["LocalCaching"]),
    ],
    dependencies: [
            .package(url: "https://github.com/realm/realm-cocoa.git", from: "10.0.0"),
        ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LocalCaching",
            dependencies: [
                .product(name: "RealmSwift", package: "realm-cocoa")
            ]),
        .testTarget(
            name: "LocalCachingTests",
            dependencies: ["LocalCaching"]),
    ]
)
