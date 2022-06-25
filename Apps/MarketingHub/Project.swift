import ProjectDescription

let infoPlist: [String: InfoPlist.Value] = [
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "UILaunchStoryboardName": "LaunchScreen"
]

let project = Project(
    name: "MarketingHub",
    organizationName: "MateusNobre",
    settings: nil,
    
    targets: [
        Target(
            name: "MarketingHub",
            platform: .iOS,
            product: .app,
            bundleId: "MateusNobre.MarketingHub",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: "Source/**",
            resources: "Resources/**",
            dependencies: [
                .xcframework(path: "../../Carthage/Build/RxBlocking.xcframework"),
                .xcframework(path: "../../Carthage/Build/RxCocoa.xcframework"),
                .xcframework(path: "../../Carthage/Build/RxRelay.xcframework"),
                .xcframework(path: "../../Carthage/Build/RxSwift.xcframework"),
                .xcframework(path: "../../Carthage/Build/SnapKit.xcframework"),
                .project(target: "Creators", path: "../../Modules/Creators/"),
                .project(target: "Presentation", path: "../../Modules/Presentation/")
            ]
        )
    ]
)

