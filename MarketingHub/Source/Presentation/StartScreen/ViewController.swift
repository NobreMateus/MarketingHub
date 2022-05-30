import UIKit
import Creators

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let repository = CreatorsRepository()
        let useCase = GetAllCreatorsUseCase(repository: repository)
        let viewModel = StartScreenViewModel(getAllCreatorsUseCase: useCase)
        let vc = StartScreenViewController(viewModel: viewModel)
        
        view.backgroundColor = .red
        navigationController?.pushViewController(vc, animated: true)
    }
}

