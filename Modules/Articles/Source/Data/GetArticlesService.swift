import Foundation

public protocol GetArticlesServiceProtocol {
    func fetch(completion: @escaping (ArticlesDTO?, Error?) -> Void)
}

final class GetArticlesService: GetArticlesServiceProtocol {
    func fetch(completion: @escaping (ArticlesDTO?, Error?) -> Void) {
        guard let url = URL(string: "") else {
            completion(nil, nil)
            return
        }
        URLSession.shared.dataTask(with: url){ data, _, error in
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
    }
}

public struct ArticlesDTO: Decodable {
    var articles: [ArticlesDTO]
}

public struct ArticleDTO: Decodable {
    var title: String
    var summary: String
    var imageName: String
}


