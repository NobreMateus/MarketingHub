import Foundation

public protocol GetArticlesServiceProtocol {
    func fetch(completion: @escaping (ArticlesDTO?, Error?) -> Void)
}

public final class GetArticlesService: GetArticlesServiceProtocol {
    
    public init() {}
    
    public func fetch(completion: @escaping (ArticlesDTO?, Error?) -> Void) {
        guard let url = URL(string: "https://raw.githubusercontent.com/NobreMateus/MarketingHub/main/api/articles.json") else {
            completion(nil, nil)
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url){ data, _, error in
            guard let data = data else {
                completion(nil, error)
                return
            }
            do {
                let articles = try JSONDecoder().decode(ArticlesDTO.self, from: data)
                completion(articles, error)
            } catch {
               completion(nil, error)
            }
            
        }
        dataTask.resume()
    }
}

public struct ArticlesDTO: Decodable {
    var articles: [ArticleDTO]
}

public struct ArticleDTO: Decodable {
    var title: String
    var summary: String
    var imageName: String
}


