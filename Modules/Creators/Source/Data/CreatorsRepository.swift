import Foundation

final public class CreatorsRepository: CreatorsRepositoryProtocol {
    
    private let creatorsService: CreatorsServiceProtocol
    
    public init(creatorsService: CreatorsServiceProtocol) {
        self.creatorsService = creatorsService
    }
    
    public func getAllCreators(completion: (([Creator]) -> Void)?) {
        creatorsService.fetch() { creators, error in
            let domainCreators = creators?.creators.map { creator in
                Creator(title: creator.title, site: URL(string: creator.site), image: URL(string: creator.image)) }
            completion?(domainCreators ?? [])
        }
    }
}
