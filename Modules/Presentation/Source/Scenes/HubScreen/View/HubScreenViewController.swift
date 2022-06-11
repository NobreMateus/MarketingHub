import UIKit
import SnapKit
import Articles

public final class HubScreenViewController: UIViewController {
    
    let viewModel: HubScreenViewModelProtocol
    var articles: [Article] = []
    
    private lazy var tableView: UITableView = {
        $0.delegate = self
        $0.dataSource = self
        $0.separatorStyle = .none
        $0.allowsSelection = false
        return $0
    }(UITableView())
    
    private lazy var creatorsCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        viewLayout.minimumLineSpacing = 8
        let collection = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collection.delegate = self
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        collection.register(CreatorCell.self, forCellWithReuseIdentifier: "MyCell")
        return collection
    }()
    
    public init(viewModel: HubScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        title = "Marketing Hub"
        
        setupConstraints()
        let _ = viewModel.numberOfCreators.subscribe(onNext: { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        })
        let _ = viewModel.numberOfArticles.subscribe(onNext: { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        })
        let _ = viewModel.articles.subscribe(onNext: { [weak self] articles in
            self?.articles = articles
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        })
        
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
}

extension HubScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 72, height: 72)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        try! viewModel.numberOfCreators.value()
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = creatorsCollectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

extension HubScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 72
        } else {
            return 108
        }
    }
     
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Criadores"
        } else {
            return "Artigos"
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return try! viewModel.numberOfArticles.value()
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = UITableViewCell()
            cell.contentView.addSubview(creatorsCollectionView)
            creatorsCollectionView.snp.makeConstraints { make in
                make.top.equalTo(cell.contentView.snp.top)
                make.trailing.equalTo(cell.contentView.snp.trailing)
                make.leading.equalTo(cell.contentView.snp.leading)
                make.height.equalTo(72)
            }
            return cell
        } else {
            let cell = ArticleCell(article: articles[indexPath.row])
            cell.setup()
            return cell
        }
    }
}
