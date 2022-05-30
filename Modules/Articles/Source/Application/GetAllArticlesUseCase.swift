final public class GetAllArticlesUseCase: GetAllArticlesUseCasing {
    
    private let repository: ArticlesRepositoryProtocol
    
    public init(repository: ArticlesRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(completion: @escaping ([Article]) -> Void) {
        repository.getAllArticles(completion: completion)
    }
}
