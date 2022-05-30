import UIKit

final class CreatorCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .red
        layer.cornerRadius = 12
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
