public struct Article {
    
    let title: String
    let summary: String
    let imageName: String
    
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
