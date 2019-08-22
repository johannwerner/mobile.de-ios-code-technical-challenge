import RxSwift
import RxCocoa

/// <#Brief description of the purpose of the view controller#>
/// - Requires: `RxSwift`
class MainImageViewController: UIViewController {
    
    // MARK: Dependencies
    private let viewModel: MainImageViewModel
    
    // MARK: Rx
    private let viewAction = PublishRelay<MainImageViewAction>()
    
    // MARK: View components
    private let collectionView: UICollectionView
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    
    init(viewModel: MainImageViewModel) {
        self.viewModel = viewModel
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewLayout
        )
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = UIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBinding()
        
        observeViewEffect()
    }
}

// MARK: - Setup

private extension MainImageViewController {

    /// Initializes and configures components in controller.
    func setUpViews() {
        view.addSubview(collectionView)
        
        collectionView.autoPinEdgesToSuperviewEdges()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MainImageCollectionViewCell.self, forCellWithReuseIdentifier: MainImageCollectionViewCell.className)
    }
    
    /// Binds controller user events to view model.
    func setUpBinding() {
        viewModel.bind(to: viewAction)
    }
}

// MARK: - Rx

private extension MainImageViewController {

    /// Starts observing view effects to react accordingly.
    func observeViewEffect() {
        viewModel
            .viewEffect
            .subscribe(onNext: { [unowned self] effect in
                switch effect {
                case .someEffect:
                    break
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - CollectionView
extension MainImageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfModels
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainImageCollectionViewCell.className, for: indexPath)
        guard let model = viewModel.modelForIndex(index: indexPath.row) else {
            assertionFailure("model is nil")
            return cell
        }
        guard let mainImageCell = cell as? MainImageCollectionViewCell else {
            assertionFailure("cell is not type MainImageCollectionViewCell")
            return cell
        }
        mainImageCell.fill(with: model)
        return mainImageCell
    }
}

extension MainImageViewController: UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(
            width: collectionView.frame.size.width,
            height: collectionView.frame.size.height
        )
        return size
    }
}
