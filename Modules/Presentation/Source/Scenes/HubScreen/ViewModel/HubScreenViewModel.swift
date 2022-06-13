import RxSwift
import Foundation
import Creators
import Articles
import UIKit

public protocol HubScreenViewModelProtocol {
    var creators: BehaviorSubject<[Creator]> { get }
    var articles: BehaviorSubject<[Article]> { get }
    var numberOfCreators:  BehaviorSubject<Int> { get }
    var numberOfArticles: BehaviorSubject<Int> { get }
    func openCreatorLink(at position: Int)
    func openArticleLink(at position: Int)
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
    
    public func openCreatorLink(at position: Int) {
        let creators = try! creators.value()
        guard let url = creators[position].site else { return }
        UIApplication.shared.open(url)
    }
    
    public func openArticleLink(at position: Int) {
        let _ = try! articles.value()
        guard let url = URL(
            string: "https://medium.com/startup-da-real/como-funcionam-os-esquemas-de-marketing-digital-cc97252e644d"
        ) else { return }
        UIApplication.shared.open(url)
    }
}
