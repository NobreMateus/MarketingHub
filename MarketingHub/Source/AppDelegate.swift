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
        
        let appearance = UINavigationBarAppearance()
        let navigationController =  UINavigationController(rootViewController: HubScreenViewController(viewModel: viewModel))
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .primaryColor
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.compactAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        
        window.rootViewController = navigationController
        
        
        
        self.window = window
        self.window?.isHidden = false
        window.makeKeyAndVisible()
        
        return true
    }
}

final class ArticlesRepository: ArticlesRepositoryProtocol {
    
    private let data: [Article] = [
        .init(title: "Como funcionam os esquemas de Marketing Digital.", summary: "As táticas que oportunistas usam para enganar sua percepção — Marketing digital se tornou uma grande febre nos últimos anos.", imageName: ""),
        .init(title: "titulo 2", summary: "resumo", imageName: ""),
        .init(title: "titulo 3", summary: "resumo", imageName: ""),
        .init(title: "titulo 4", summary: "resumo", imageName: ""),
        .init(title: "titulo 5", summary: "resumo", imageName: ""),
        .init(title: "titulo 6", summary: "resumo", imageName: ""),
        .init(title: "titulo 7", summary: "resumo", imageName: ""),
    ]
    
    func getAllArticles(completion: @escaping ([Article]) -> Void) {
        completion(data)
    }
}


