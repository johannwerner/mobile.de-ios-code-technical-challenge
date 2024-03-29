import RxSwift
import RxCocoa
import PureLayout

/// Brief description of the purpose of the view controller
/// - Requires: `RxSwift`
class ImageGalleryModuleViewController: UIViewController {
    
    // MARK: Dependencies
    private let viewModel: ImageGalleryModuleViewModel
    
    // MARK: Rx
    private let viewAction = PublishRelay<ImageGalleryModuleViewAction>()
    
    // MARK: View components
    private let primaryButton = UIButton()
    private let collectionView: UICollectionView
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    
    init(viewModel: ImageGalleryModuleViewModel) {
        self.viewModel = viewModel
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumInteritemSpacing = 0
        collectionViewLayout.minimumLineSpacing = 0
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

private extension ImageGalleryModuleViewController {

    /// Initializes and configures components in controller.
    func setUpViews() {
        title = AppConstants.appName
        view.backgroundColor = .white
        
        setUpCollectionView()
        setUpPrimaryButton()
    }
    
    func setUpCollectionView() {
        view.addSubview(collectionView)
        collectionView.autoPinEdgesToSuperviewEdges()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            MainImageCollectionViewCell.self,
            forCellWithReuseIdentifier: MainImageCollectionViewCell.className
        )
        collectionView.alpha = 0
    }
    
    func setUpPrimaryButton() {
        view.addSubview(primaryButton)
        primaryButton.autoAlignAxis(toSuperviewAxis: .vertical)
        primaryButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 50)
        primaryButton.autoSetDimension(.height, toSize: 50)
        primaryButton.autoSetDimension(.width, toSize: 200, relation: .greaterThanOrEqual)
        primaryButton.layer.cornerRadius = 4.0
        
        primaryButton.backgroundColor = ColorTheme.primaryAppColor
        primaryButton.setTitle("image_gallery_primary_button".localizedString(), for: .normal)
        primaryButton.rx.tap.subscribe(onNext: { [unowned self] _ in
            self.viewAction.accept(.showImages)
        })
        .disposed(by: disposeBag)
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
                    self.primaryButton.isHidden = true
                    UIView.animate(withDuration: 0.4, animations: { [weak self]  in
                        self?.collectionView.alpha = 1.0
                    })
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
