import RxCocoa
import RxSwift

/// <#Brief description of the purpose of the view model#>
/// - Requires: `RxSwift`, `MvRx`
/// - Note: A view model can refer to one or more use cases.
class ImageGalleryModuleViewModel {

    // MARK: - Properties
    private var model: ImageGalleryModel
    
    // MARK: - View Effect
    let viewEffect = PublishRelay<ImageGalleryModuleViewEffect>()
    
    // MARK: Dependencies
    private let coordinator: ImageGalleryModuleCoordinator
    private let useCase: ImageGalleryModuleUseCase
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    
    init(coordinator: ImageGalleryModuleCoordinator,
         configurator: ImageGalleryModuleConfigurator,
         model: ImageGalleryModel
        ) {
        self.coordinator = coordinator
        self.model = model
        self.useCase = ImageGalleryModuleUseCase(interactor: configurator.imageGalleryModuleInteractor)
        
        observeViewEffect()
    }
}

// MARK: - Public functions

extension ImageGalleryModuleViewModel {
    
    var numberOfModels: Int {
        return model.images.count
    }
    
    func modelForIndex(index: Int) -> ImageGalleryModel.Image? {
        return model.images[safe: index]
    }
    
    func bind(to viewAction: PublishRelay<ImageGalleryModuleViewAction>) {
        viewAction
            .asObservable()
            .subscribe(onNext: { [unowned self] viewAction in
                switch viewAction {
                case .showImages:
                    self.showImages()
                case .selectedIndex(let index):
                    self.coordinator.showLargeImage(
                        imageGalleryModel: self.model,
                        selectedIndex: index,
                        animted: true
                    )
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Private functions

private extension ImageGalleryModuleViewModel {
    
    func showImages() {
        self.viewEffect.accept(.showImages)
    }
}

// MARK: - Rx

private extension ImageGalleryModuleViewModel {
    
    /// - Note: Privately observing view effects in the view model is meant to make the association between a specific effect and certain view states easier.
    func observeViewEffect() {
        viewEffect
            .asObservable()
            .subscribe(onNext: { effect in
                switch effect {
                case .showImages:
                    break
                }
            })
            .disposed(by: disposeBag)
    }
}
