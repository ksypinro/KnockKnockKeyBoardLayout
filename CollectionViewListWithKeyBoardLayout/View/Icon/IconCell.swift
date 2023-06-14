import UIKit

final class IconCell: UICollectionViewCell {
    typealias registration = UICollectionView.CellRegistration<IconCell, KnockKnock.Item>
    static let nib = UINib(nibName: "IconCell", bundle: nil)
}
