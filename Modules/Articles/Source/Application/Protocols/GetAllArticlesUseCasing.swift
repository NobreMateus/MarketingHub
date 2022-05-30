public protocol GetAllArticlesUseCasing {
    func execute(completion: @escaping ([Article]) -> Void)
}
