public struct CreatorsDTO: Decodable {
    var creators: [CreatorDTO]
}

public struct CreatorDTO: Decodable {
    var title: String
    var site: String
    var image: String
}
