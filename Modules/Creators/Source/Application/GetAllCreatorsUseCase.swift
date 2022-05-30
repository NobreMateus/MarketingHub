import Foundation

final public class GetAllCreatorsUseCase: GetAllCreatorsUseCasing {
    
    private let repository: CreatorsRepositoryProtocol
    
    public init(repository: CreatorsRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(completion: (([Creator]) -> Void)?) {
        repository.getAllCreators(completion: completion)
    }
}
