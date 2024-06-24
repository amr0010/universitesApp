// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "UniversitiesList",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "UniversitiesList",
            targets: ["UniversitiesList"]),
    ],
    dependencies: [
        .package(path: "../Networking"),
        .package(path: "../Models"),
        .package(path: "../LocalCaching")
    ],
    targets: [
        .target(
            name: "UniversitiesList",
            dependencies: [
                "Networking",
                "Models",
                "LocalCaching"
            ]),
        .testTarget(
            name: "UniversitiesListTests",
            dependencies: ["UniversitiesList"]),
    ]
)

