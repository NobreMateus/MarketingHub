public final class ArticlesRepository: ArticlesRepositoryProtocol {
    
    let getArticlesService: GetArticlesServiceProtocol
    
    public init(getArticlesService: GetArticlesServiceProtocol) {
        self.getArticlesService = getArticlesService
    }
    
    private let data: [Article] = [
        .init(title: "Como funcionam os esquemas de Marketing Digital.", summary: "As táticas que oportunistas usam para enganar sua percepção — Marketing digital se tornou uma grande febre nos últimos anos.", imageName: ""),
        .init(title: "titulo 2", summary: "resumo", imageName: ""),
        .init(title: "titulo 3", summary: "resumo", imageName: ""),
        .init(title: "titulo 4", summary: "resumo", imageName: ""),
        .init(title: "titulo 5", summary: "resumo", imageName: ""),
        .init(title: "titulo 6", summary: "resumo", imageName: ""),
        .init(title: "titulo 7", summary: "resumo", imageName: ""),
    ]
    
    public func getAllArticles(completion: @escaping ([Article]) -> Void) {
        completion(data)
    }
}
