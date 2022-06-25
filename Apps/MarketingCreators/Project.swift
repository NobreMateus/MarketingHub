import ProjectDescription

let project = Project(
    name: "MarketingCreators",
    organizationName: "MateusNobre",
    settings: nil,
    
    targets: [
        Target(
            name: "MarketingCreators",
            platform: .iOS,
            product: .app,
            bundleId: "MateusNobre.MarketingCreators",
            infoPlist: .default,
            sources: "Source/**",
            resources: "Resources/**",
            dependencies: [
                .project(target: "Creators", path: "../../Modules/Creators/"),
            ]
        )
    ]
)

