import RxSwift
import RxCocoa
import PureLayout

/// <#Brief description of the purpose of the view controller#>
/// - Requires: `RxSwift`
class ImageGalleryModuleViewController: UIViewController {
    
    // MARK: Dependencies
    private let viewModel: ImageGalleryModuleViewModel
    
    // MARK: Rx
    private let viewAction = PublishRelay<ImageGalleryModuleViewAction>()
    
    // MARK: View components
    private let showImagesButton = UIButton()
    private let collectionView: UICollectionView
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    
    init(viewModel: ImageGalleryModuleViewModel) {
        self.viewModel = viewModel
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
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

private extension ImageGalleryModuleViewController {

    /// Initializes and configures components in controller.
    func setUpViews() {
        title = "mobile" //TODO: Put in constants
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        
        collectionView.autoPinEdgesToSuperviewEdges()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MainImageCollectionViewCell.self, forCellWithReuseIdentifier: MainImageCollectionViewCell.className)
        collectionView.isHidden = true
        
        view.addSubview(showImagesButton)
        showImagesButton.autoCenterInSuperview()
        showImagesButton.autoSetDimensions(to: CGSize(width: 150, height: 100))
        showImagesButton.setTitleColor(.blue, for: .normal)
        showImagesButton.setTitle("Show Images", for: .normal) //TODO: localize here
        
        showImagesButton.rx.tap.subscribe(onNext: { [unowned self] in
            self.viewAction.accept(.showImages)
        }).disposed(by: disposeBag)
    }
    
    /// Binds controller user events to view model.
    func setUpBinding() {
        viewModel.bind(to: viewAction)
    }
}

// MARK: - Rx

private extension ImageGalleryModuleViewController {

    /// Starts observing view effects to react accordingly.
    func observeViewEffect() {
        viewModel
            .viewEffect
            .subscribe(onNext: { [unowned self] effect in
                switch effect {
                case .showImages:
                    self.collectionView.reloadData()
                    self.collectionView.isHidden = false
                    self.showImagesButton.isHidden = true
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - CollectionView
extension ImageGalleryModuleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfModels
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainImageCollectionViewCell.className, for: indexPath)
        guard let model = viewModel.modelForIndex(index: indexPath.row) else {
            assertionFailure("model is nil")
            return cell
        }
        guard let imageGalleryCell = cell as? MainImageCollectionViewCell else {
            assertionFailure("cell is not type imageGalleryCell")
            return cell
        }
        imageGalleryCell.fill(with: model)
        return imageGalleryCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewAction.accept(.selectedIndex(indexPath.row))
    }
}

extension ImageGalleryModuleViewController: UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(
            width: collectionView.frame.size.width / 3,
            height: 200
        )
        return size
    }
}
