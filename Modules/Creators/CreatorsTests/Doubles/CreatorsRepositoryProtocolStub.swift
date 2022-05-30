@testable import Creators

final class CreatorsRepositoryProtocolStub: CreatorsRepositoryProtocol {
    func getAllCreators(completion: (([Creator]) -> Void)?) {
        completion?([Creator.init(title: "", site: nil, image: nil)])
    }
}
