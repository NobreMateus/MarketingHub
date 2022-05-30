import XCTest
@testable import Articles

final class GetAllArticlesUseCaseTests: XCTestCase {
    
    private let articlesRepositoryProtocolSpy = ArticlesRepositoryProtocolSpy()
    private lazy var sut = GetAllArticlesUseCase(repository: articlesRepositoryProtocolSpy)
    
    func test_execute_shouldCallGetAllArticlesInRepository() {
        sut.execute() { _ in }
        
        XCTAssertTrue(articlesRepositoryProtocolSpy.didGetAllArticlesCalled)
    }
}
