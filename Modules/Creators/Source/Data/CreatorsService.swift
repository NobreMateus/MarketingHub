import Foundation

final class CreatorsService {
    
    func fetch() {
        let session = URLSession.shared.dataTask(with: URL(string: "https://raw.githubusercontent.com/NobreMateus/MarketingHub/main/api/creator.json")!){data, response, error in
            let creators = try! JSONDecoder().decode(CreatorsDTO.self, from: data!)
        }
        session.resume()
    }
    
}

struct CreatorsDTO: Decodable {
    var creators: [CreatorDTO]
}

struct CreatorDTO: Decodable {
	var title: String
    var site: String
    var image: String
}
