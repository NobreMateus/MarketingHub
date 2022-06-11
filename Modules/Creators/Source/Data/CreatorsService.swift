import Foundation

public protocol CreatorsServiceProtocol {
    func fetch(completion: @escaping ((CreatorsDTO?, Error?) -> Void))
}

public final class GetCreatorsService: CreatorsServiceProtocol {
    
    public init() {}
    
    public func fetch(completion: @escaping ((CreatorsDTO?, Error?) -> Void)) {
        guard let url = URL(string: "https://raw.githubusercontent.com/NobreMateus/MarketingHub/main/api/creator.json") else {
            completion(nil, nil)
            return
        }
        let session = URLSession.shared.dataTask(with: url){data, response, error in
            guard let data = data else {
                completion(nil, error)
                return
            }
            do {
                let creators = try JSONDecoder().decode(CreatorsDTO.self, from: data)
                completion(creators, error)
                
            } catch {
                completion(nil, error)
            }
        }
        session.resume()
    }
    
}
