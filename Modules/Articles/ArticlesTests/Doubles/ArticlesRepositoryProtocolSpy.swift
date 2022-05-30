final class ArticlesRepositoryProtocolSpy: ArticlesRepositoryProtocol {
    
    private(set) var didGetAllArticlesCalled = false
    
    func getAllArticles(completion: @escaping ([Article]) -> Void) {
        didGetAllArticlesCalled = true
    }
}
