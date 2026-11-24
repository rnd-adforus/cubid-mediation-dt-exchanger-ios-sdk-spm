// swift-tools-version: 5.9
import PackageDescription

let versionInfo = "1.0.0"

let package = Package(
    name: "UFyKit",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "UFyKit",
            targets: ["UFyKit", "UFyKitResources"]
        ),
        .library(
            name: "Admob-Mediation-Fyber",
            targets: ["UFyKitAdapter"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/inner-active/DTExchangeSDK-iOS-SPM", "8.4.6"..<"8.4.8"),
        .package(
            url: "https://github.com/googleads/googleads-mobile-ios-mediation-dtexchange.git",
            "8.4.600"..<"8.4.800"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "UFyKit",
            url: "https://nexus.adforus.com/repository/cubid_iOS/UFy/\(versionInfo)/UFyKit-SPM.zip",
            checksum: "b87447a9d2924d118c5f1d7c6ca989a9b26345f142bb22bfe7d4f8834d4a83ae"
        ),
        .target(
            name: "UFyKitTarget",
            dependencies: [
                .target(name: "UFyKit"),
                .product(name: "DTExchangeSDK", package: "DTExchangeSDK-iOS-SPM"),
            ],
            path: "UFyKitTarget/Core"
        ),
        .target(
            name: "UFyKitAdapter",
            dependencies: [
                .target(name: "UFyKit"),
                .product(name: "DTExchangeAdapterTarget", package: "googleads-mobile-ios-mediation-dtexchange"),
            ],
            path: "UFyKitTarget/Adapters"
        ),
        .target(
            name: "UFyKitResources",
            path: "Sources/UFyKitResources",
            resources: [
                .copy("UFyResources.bundle")
            ]
        ),
    ]
)
