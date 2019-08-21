import RxSwift
import RxCocoa

/// <#Brief description of the purpose of the view controller#>
/// - Requires: `RxSwift`
class ImageGalleryModuleViewController: UIViewController {
    
    // MARK: Dependencies
    private let viewModel: ImageGalleryModuleViewModel
    
    // MARK: Rx
    private let viewAction = PublishRelay<ImageGalleryModuleViewAction>()
    
    // MARK: View components
    private let someButton = UIButton()
    private let collectionView: UICollectionView
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    
    init(viewModel: ImageGalleryModuleViewModel) {
        self.viewModel = viewModel
        let collectionViewLayout = UICollectionViewLayout()
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
                case .someEffect:
                    break
                }
            })
            .disposed(by: disposeBag)
    }
}
