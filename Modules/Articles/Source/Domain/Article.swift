public struct Article {
    
    public let title: String
    public let summary: String
    public let imageName: String
    public let site: String
    
    public init(
        title: String,
        summary: String,
        imageName: String,
        site: String
    ) {
        self.title = title
        self.summary = summary
        self.imageName = imageName
        self.site = site
    }
}
