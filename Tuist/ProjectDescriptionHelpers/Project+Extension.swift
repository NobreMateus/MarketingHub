import ProjectDescription

extension Project {
    
    public static func createModule(name: String) -> Project {
        let organizationName = "MateusNobre"
        return Project(
            name: name,
            organizationName: organizationName,
            settings: nil,
            
            targets: [
                Target(
                    name: name,
                    platform: .iOS,
                    product: .framework,
                    bundleId: "\(organizationName).\(name)",
                    infoPlist: .default,
                    sources: "Source/**"
                ),
                Target(
                    name: "\(name)Tests",
                    platform: .iOS,
                    product: .unitTests,
                    bundleId: "\(organizationName).\(name)Tests",
                    infoPlist: .default,
                    sources: "\(name)Tests/**"
                )
            ]
        )
    }
    
    public static func createModuleWithResources(name: String) -> Project {
        let organizationName = "MateusNobre"
        return Project(
            name: name,
            organizationName: organizationName,
            settings: nil,
            
            targets: [
                Target(
                    name: name,
                    platform: .iOS,
                    product: .framework,
                    bundleId: "\(organizationName).\(name)",
                    infoPlist: .default,
                    sources: "Source/**",
                    resources: "Resources/**"
                ),
                Target(
                    name: "\(name)Tests",
                    platform: .iOS,
                    product: .unitTests,
                    bundleId: "\(organizationName).\(name)Tests",
                    infoPlist: .default,
                    sources: "\(name)Tests/**"
                )
            ]
        )
    }
}
