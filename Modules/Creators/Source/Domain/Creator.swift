import Foundation

public struct Creator {
    
    public init(
        title: String,
        site: URL?,
        image: URL?
    ) {
        self.title = title
        self.site = site
        self.image = image
    }
    
    public let title: String
    public let site: URL?
    public let image: URL?
}
