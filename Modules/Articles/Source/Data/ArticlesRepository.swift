public final class ArticlesRepository: ArticlesRepositoryProtocol {
    
    let getArticlesService: GetArticlesServiceProtocol
    
    public init(getArticlesService: GetArticlesServiceProtocol) {
        self.getArticlesService = getArticlesService
    }
    
    public func getAllArticles(completion: @escaping ([Article]) -> Void) {
        getArticlesService.fetch() { articlesDTO, error in
            let articles = articlesDTO?.articles.map {
                Article(
                    title: $0.title,
                    summary: $0.summary,
                    imageName: $0.imageName,
                    site: $0.site
                )
            }
            completion(articles ?? [])
        }
    }
}
