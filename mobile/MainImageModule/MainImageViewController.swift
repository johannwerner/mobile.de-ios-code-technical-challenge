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

    
    // MARK: Tooling
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    
    init(viewModel: MainImageViewModel) {
        self.viewModel = viewModel
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
