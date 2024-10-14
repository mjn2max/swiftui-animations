// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUI-Animations",
    platforms: [.iOS(.v15), .macOS(.v13), .macCatalyst(.v15), .tvOS(.v15), .watchOS(.v8)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftUI-Animations",
            targets: ["SwiftUI-Animations"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftUI-Animations",
            path: "Sources",
            exclude: [
                "../Demo"
            ]
        ),
        .testTarget(
            name: "SwiftUI-AnimationsTests",
            dependencies: ["SwiftUI-Animations"],
            path: "Tests",
            exclude: [
                "../Demo"
            ]
        ),
    ]
)
