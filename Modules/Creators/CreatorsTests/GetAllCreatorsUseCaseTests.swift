import XCTest
@testable import Creators

final class GetAllCreatorsUseCaseTests: XCTestCase {
    
    private let creatorsRepositoryStub = CreatorsRepositoryProtocolStub()
    private lazy var sut = GetAllCreatorsUseCase(repository: creatorsRepositoryStub)
    
    func test_execute_should() {
        var creators: [Creator]? = nil
        let exp = expectation(description: "Execute Callback")
        
        sut.execute { result in
            creators = result
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        XCTAssertNotNil(creators)
        XCTAssertEqual(creators?.count, 1)
    }
}
