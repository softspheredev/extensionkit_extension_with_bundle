import ProjectDescription

let project = Project(
    name: "App",
    targets: [
        .target(
            name: "ActivityReportExtension",
            destinations: .iOS,
            product: .extensionKitExtension,
            bundleId: "io.tuist.ActivityReportExtension",
            infoPlist: .extendingDefault(
                with: [
                    "EXAppExtensionAttributes": [
                        "EXExtensionPointIdentifier": "com.apple.deviceactivityui.report-extension"
                    ]
                ]
            ),
            sources: ["ActivityReportExtension/Sources/**"],
            entitlements: .dictionary(["com.apple.developer.family-controls": true]),
            dependencies: [.target(name: "TotalActivityReport")]
        ),
        .target(
            name: "TotalActivityReport",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "io.tuist.TotalActivityReport",
            sources: ["TotalActivityReport/Sources/**"],
            resources: ["TotalActivityReport/Resources/**"]
        ),
        .target(
            name: "App",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.App",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["App/Sources/**"],
            resources: ["App/Resources/**"],
            entitlements: .dictionary(["com.apple.developer.family-controls": true]),
            dependencies: [
                .target(name: "TotalActivityReport"),
                .target(name: "ActivityReportExtension")
            ]
        ),
        .target(
            name: "AppTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.AppTests",
            infoPlist: .default,
            sources: ["App/Tests/**"],
            resources: [],
            dependencies: [.target(name: "App")]
        ),
    ]
)
