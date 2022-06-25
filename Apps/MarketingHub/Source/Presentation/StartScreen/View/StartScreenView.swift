import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class StartScreenView: UIView {
    
    private let viewModel: StartScreenViewModelProtocol
    private let disposeBag = DisposeBag()
    
    private lazy var creatorsTableView: UITableView = {
        $0.backgroundColor = .black
        $0.register(CreatorCell.self, forCellReuseIdentifier: "cell")
        return $0
    }(UITableView())
    
    init(viewModel: StartScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setup() {
        addSubview(creatorsTableView)
        setupConstraints()
        setupTableViewBinder()
    }
    
    private func setupConstraints() {
        creatorsTableView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    private func setupTableViewBinder() {
        viewModel.creators.asObservable().bind(to: creatorsTableView.rx.items(cellIdentifier: "cell")) { _, model, cell in
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.6, delay: 0, animations: {
                    (cell as? CreatorCell)?.configure(title: model.title)
                }, completion: nil)
            }
        }.disposed(by: disposeBag)
    }
}

final class CreatorCell : UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        return $0
    }(UILabel())
    
    func configure(title: String) {
        titleLabel.text = title
        setup()
    }
    
    private func setup() {
        contentView.addSubview(titleLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView.snp.leading).offset(24)
        }
    }
}
