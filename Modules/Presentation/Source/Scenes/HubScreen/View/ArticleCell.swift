import UIKit
import SnapKit
import Articles

final class ArticleCell: UITableViewCell {
    
    private let article: Article
    
    private lazy var containerView: UIView = {
        $0.backgroundColor = .white
        $0.layer.shadowOffset = .init(width: 2, height: 2)
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 3
        $0.layer.shadowOpacity = 0.3
        return $0
    }(UIView())
    
    private lazy var contentImage: UIImageView = {
        let bundle = Bundle(for: ArticleCell.self)
        $0.image = UIImage(named: "article-image", in: bundle, with: nil)
        return $0
    }(UIImageView())
    
    private lazy var contentTitle: UILabel = {
        $0.text = article.title
        $0.numberOfLines = 2
        $0.font = .systemFont(ofSize: 14, weight: .bold)
        return $0
    }(UILabel())
    
    private lazy var contentSummary: UILabel = {
        $0.text = article.summary
        $0.numberOfLines = 2
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        return $0
    }(UILabel())
    
    private lazy var readMoreLabel: UILabel = {
        $0.text = "Ler mais"
        $0.font = .systemFont(ofSize: 10)
        $0.textColor = .primaryColor
        return $0
    }(UILabel())
    
    init(article: Article) {
        self.article = article
        super.init(style: .default, reuseIdentifier: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    func setup() {
        containerView.layer.cornerRadius = 12
        containerView.addSubview(contentImage)
        containerView.addSubview(contentTitle)
        containerView.addSubview(contentSummary)
        containerView.addSubview(readMoreLabel)
        contentView.addSubview(containerView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentImage.snp.makeConstraints { make in
            make.top.equalTo(containerView)
            make.bottom.equalTo(containerView)
            make.leading.equalTo(containerView)
            make.width.equalTo(100)
        }
        containerView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView).offset(-24)
            make.leading.equalTo(contentView).offset(24)
            make.height.equalTo(100)
        }
        contentTitle.snp.makeConstraints { make in
            make.leading.equalTo(contentImage.snp.trailing).offset(16)
            make.trailing.equalTo(containerView.snp.trailing).offset(-8)
            make.top.equalTo(containerView.snp.top).offset(16)
        }
        contentSummary.snp.makeConstraints { make in
            make.leading.equalTo(contentImage.snp.trailing).offset(16)
            make.trailing.equalTo(containerView.snp.trailing).offset(-8)
            make.top.equalTo(contentTitle.snp.bottom).offset(4)
        }
        readMoreLabel.snp.makeConstraints { make in
            make.trailing.equalTo(containerView).offset(-16)
            make.bottom.equalTo(containerView).offset(-8)
        }
    }
}
