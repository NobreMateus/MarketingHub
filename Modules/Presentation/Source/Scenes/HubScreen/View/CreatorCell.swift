import UIKit
import SnapKit

final class CreatorCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        $0.backgroundColor = .blue
        let bundle = Bundle(for: CreatorCell.self)
        $0.image = UIImage(named: "content-creator", in: bundle, with: nil)
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .red
        layer.cornerRadius = 12
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setup() {
        clipsToBounds = true
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}
