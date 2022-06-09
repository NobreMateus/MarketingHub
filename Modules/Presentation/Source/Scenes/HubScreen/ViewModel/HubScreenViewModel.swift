import RxSwift
import Foundation
import Creators
import Articles

public protocol HubScreenViewModelProtocol {
    var creators: BehaviorSubject<[Creator]> { get }
    var articles: BehaviorSubject<[Article]> { get }
    var numberOfCreators:  BehaviorSubject<Int> { get }
    var numberOfArticles: BehaviorSubject<Int> { get }
}

public final class HubScreenViewModel: HubScreenViewModelProtocol {
    
    private let getAllCreatorsUseCase: GetAllCreatorsUseCasing
    private let getAllArticlesUseCase: GetAllArticlesUseCasing
    public var creators = BehaviorSubject<[Creator]>(value: [])
    public var numberOfCreators = BehaviorSubject<Int>(value: 0)
    public var numberOfArticles = BehaviorSubject<Int>(value: 0)
    private let disposeBag = DisposeBag()
    
    public var articles = BehaviorSubject<[Article]>(value: [])
    
    public init(
        getAllCreatorsUseCase: GetAllCreatorsUseCasing,
        getAllArticlesUseCase: GetAllArticlesUseCasing
    ) {
        self.getAllCreatorsUseCase = getAllCreatorsUseCase
        self.getAllArticlesUseCase = getAllArticlesUseCase
        let _ = creators.subscribe(onNext: { [weak self] value in
            self?.numberOfCreators.onNext(value.count)
        }).disposed(by: disposeBag)
        let _ =
        getAllCreators()
        getAllArticles()
    }
    
    func getAllCreators() {
        getAllCreatorsUseCase.execute() { [weak self] creators in
            self?.creators.onNext(creators)
        }
    }
    
    func getAllArticles() {
        getAllArticlesUseCase.execute() { [weak self] articles in
            self?.numberOfArticles.onNext(articles.count)
            self?.articles.onNext(articles)
        }
    }
}
