import Foundation

final class CreatorsService {
    
    func fetch() {
        URLSession.shared.dataTask(with: URL(string: "")!){data, response, error in
            let creators = try! JSONDecoder().decode(CreatorsDTO.self, from: data!)
        }
    }
    
}

struct CreatorsDTO: Decodable {
	var title: String
    var site: String
    var image: String
}
