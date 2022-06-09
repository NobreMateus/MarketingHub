public struct Article {
    
    public let title: String
    public let summary: String
    public let imageName: String
    
    public init(
        title: String,
        summary: String,
        imageName: String
    ) {
        self.title = title
        self.summary = summary
        self.imageName = imageName
    }
}
