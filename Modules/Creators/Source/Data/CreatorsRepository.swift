import Foundation

final public class CreatorsRepository: CreatorsRepositoryProtocol {
    
    public init() {}
    
    private let creators: [Creator] = [
        .init(title: "Criador 1", site: nil, image: nil),
        .init(title: "Criador 2", site: nil, image: nil),
        .init(title: "Criador 3", site: nil, image: nil),
        .init(title: "Criador 5", site: nil, image: nil),
        .init(title: "Criador 5", site: nil, image: nil),
        .init(title: "Criador 5", site: nil, image: nil),
    ]
    
    public func getAllCreators(completion: (([Creator]) -> Void)?) {
         completion?(creators)
    }
}
