public protocol ArticlesRepositoryProtocol {
    func getAllArticles(completion: @escaping ([Article]) -> Void)
}
