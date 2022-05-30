import RxSwift
import Foundation
import Creators

protocol StartScreenViewModelProtocol {
    var creators: BehaviorSubject<[Creator]> { get }
    var numberOfCreators: BehaviorSubject<Int> { get }
}

final class StartScreenViewModel: StartScreenViewModelProtocol {
    
    private let getAllCreatorsUseCase: GetAllCreatorsUseCasing

    init(getAllCreatorsUseCase: GetAllCreatorsUseCasing) {
        self.getAllCreatorsUseCase = getAllCreatorsUseCase
    }
    
    var creators = BehaviorSubject<[Creator]>(value: [])
    
    var numberOfCreators = BehaviorSubject<Int>(value: 4)
}
