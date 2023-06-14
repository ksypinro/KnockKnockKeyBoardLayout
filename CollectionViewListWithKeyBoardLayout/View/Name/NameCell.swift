import UIKit

final class NameCell: UICollectionViewCell {
    typealias registration = UICollectionView.CellRegistration<NameCell, KnockKnock.Item>
    
    @IBOutlet private weak var nameField: UITextField!
    static let nib = UINib(nibName: "NameCell", bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameField.delegate = self
    }
    
    func config(with ID: KnockKnock.Item) {
        nameField.placeholder = ID.placeHolder
    }
}

extension NameCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
