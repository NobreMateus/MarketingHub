import UIKit

final class StartScreenViewController: UIViewController {
    
    private let viewModel: StartScreenViewModelProtocol
    
    init(viewModel: StartScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    override func loadView() {
        self.view = StartScreenView(viewModel: viewModel)
    }
}
