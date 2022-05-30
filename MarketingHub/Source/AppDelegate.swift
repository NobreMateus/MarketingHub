import UIKit
import Presentation
import Creators
import Articles

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let getAllCreatorsUseCase = GetAllCreatorsUseCase(repository: CreatorsRepository())
        let getAllArticlesUseCase = GetAllArticlesUseCase(repository: ArticlesRepository())
        let viewModel = HubScreenViewModel(
            getAllCreatorsUseCase: getAllCreatorsUseCase,
            getAllArticlesUseCase: getAllArticlesUseCase
        )
        window.rootViewController = UINavigationController(rootViewController: HubScreenViewController(viewModel: viewModel))
        self.window = window
        self.window?.isHidden = false
        window.makeKeyAndVisible()
        
        return true
    }
}

final class ArticlesRepository: ArticlesRepositoryProtocol {
    
    private let data: [Article] = [
        .init(title: "", summary: "", imageName: ""),
        .init(title: "", summary: "", imageName: ""),
        .init(title: "", summary: "", imageName: ""),
        .init(title: "", summary: "", imageName: ""),
        .init(title: "", summary: "", imageName: ""),
        .init(title: "", summary: "", imageName: ""),
        .init(title: "", summary: "", imageName: ""),
    ]
    
    func getAllArticles(completion: @escaping ([Article]) -> Void) {
        completion(data)
    }
}


