import UIKit

final class TextViewCell: UICollectionViewCell {
    typealias registration = UICollectionView.CellRegistration<TextViewCell, KnockKnock.Item>
    static let nib = UINib(nibName: "TextViewCell", bundle: nil)
}
