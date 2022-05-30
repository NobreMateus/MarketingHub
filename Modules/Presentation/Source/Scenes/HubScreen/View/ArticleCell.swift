import UIKit
import SnapKit

final class ArticleCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        $0.backgroundColor = .blue
        return $0
    }(UIView())
    
    func setup() {
        containerView.layer.cornerRadius = 12
        contentView.addSubview(containerView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView).offset(-24)
            make.leading.equalTo(contentView).offset(24)
            make.height.equalTo(100)
        }
    }
}
