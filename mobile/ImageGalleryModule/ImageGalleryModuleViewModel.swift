import RxCocoa
import RxSwift

/// <#Brief description of the purpose of the view model#>
/// - Requires: `RxSwift`, `MvRx`
/// - Note: A view model can refer to one or more use cases.
class ImageGalleryModuleViewModel {

    // MARK: - Properties
    private var models: [ImageGalleryModel]  = []
    
    // MARK: - View Effect
    let viewEffect = PublishRelay<ImageGalleryModuleViewEffect>()
    
    // MARK: Dependencies
    private let coordinator: ImageGalleryModuleCoordinator
    private let useCase: ImageGalleryModuleUseCase
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    
    init(coordinator: ImageGalleryModuleCoordinator,
         configurator: ImageGalleryModuleConfigurator) {
        self.coordinator = coordinator
        self.useCase = ImageGalleryModuleUseCase(interactor: configurator.imageGalleryModuleInteractor)
        
        observeViewEffect()
    }
}

// MARK: - Public functions

extension ImageGalleryModuleViewModel {
    
    var numberOfModels: Int {
        return models.count
    }
    
    func modelForIndex(index: Int) -> ImageGalleryModel? {
        return models[safe: index]
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
                        imageGalleryModels: self.models,
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
        self.useCase.fetchImages()
            .subscribe(onNext: { [unowned self] status in
                switch status {
                case .someStatus:
                    break
                case .success(let listOfModels):
                    self.models = listOfModels
                    self.viewEffect.accept(.showImages)
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Rx

private extension ImageGalleryModuleViewModel {
    
    /// - Note: Privately observing view effects in the view model is meant to make the association between a specific effect and certain view states easier.
    func observeViewEffect() {
        viewEffect
            .asObservable()
            .subscribe(onNext: { [unowned self] effect in
                switch effect {
                case .showImages:
                    break
                }
            })
            .disposed(by: disposeBag)
    }
}
