import UIKit
import Presentation
import Creators
import Articles

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let getAllCreatorsUseCase = GetAllCreatorsUseCase(
            repository: CreatorsRepository(creatorsService: GetCreatorsService())
        )
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

