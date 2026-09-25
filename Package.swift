// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Onboard",
    platforms: [
        .iOS("18.0"),
    ],
    products: [
        .library(name: "Onboard", targets: ["Onboard"]),
    ],
    targets: [
        .target(
            name: "Onboard",
            path: "Source",
            exclude: ["OnboardingContentViewController_Private.h"],
            publicHeadersPath: "include",
            cSettings: [
                // Legacy ObjC; keep its deprecation warnings out of client builds, as
                // CocoaPods' inhibit_all_warnings! did. unsafeFlags are fine for
                // local/root packages.
                .unsafeFlags(["-w"]),
            ],
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("AVKit"),
                .linkedFramework("Accelerate"),
            ]
        ),
    ]
)
