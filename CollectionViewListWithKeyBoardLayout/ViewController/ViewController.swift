import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private lazy var viewModel = { ViewModel() }()
    private lazy var dataSource: DataSource = createDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        setUpKeyBoardLayout()
    }
}

//MARK:- DataSource

private extension ViewController {
     func createDataSource() -> DataSource {
        let nameCellRegistration = NameCell.registration(cellNib: NameCell.nib) { $0.config(with: $2) }
        let iconCellRegistration = IconCell.registration(cellNib: IconCell.nib) { _, _, _ in }
        let textCellRegistration = TextViewCell.registration(cellNib: TextViewCell.nib) { _, _, _ in }
        
        let dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, item in
            switch item {
            case .text:
                return collectionView.dequeueConfiguredReusableCell(using: textCellRegistration, for: indexPath, item: item)
            case .image:
                return collectionView.dequeueConfiguredReusableCell(using: iconCellRegistration, for: indexPath, item: item)
            case .list(_):
                return collectionView.dequeueConfiguredReusableCell(using: nameCellRegistration, for: indexPath, item: item)
            case .name:
                return collectionView.dequeueConfiguredReusableCell(using: nameCellRegistration, for: indexPath, item: item)
            }
        }

        var snapshot = Snapshot()
         
        snapshot.appendSections(viewModel.sections)
        viewModel.sections.forEach { section in
            guard let items = viewModel.items[section] else { return }
            snapshot.appendItems(items, toSection: section)
        }
        
        dataSource.apply(snapshot, animatingDifferences: false)
        
        return dataSource
    }
}

//MARK:- Helpers

private extension ViewController {
    var layout: UICollectionViewLayout {
        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        config.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: config)
    }
    
    func configureCollectionView() {
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.dataSource = dataSource
    }
    
    func setUpKeyBoardLayout() {
        view.keyboardLayoutGuide
            .topAnchor
            .constraint(equalTo: collectionView.bottomAnchor, constant: 0.0).isActive = true
    }
}

//MARK:- typeAlyas

private extension ViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<KnockKnock.Section, KnockKnock.Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<KnockKnock.Section, KnockKnock.Item>
}
