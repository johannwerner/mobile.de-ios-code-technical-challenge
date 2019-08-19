import RxCocoa
import RxSwift

/// <#Brief description of the purpose of the view model#>
/// - Requires: `RxSwift`, `MvRx`
/// - Note: A view model can refer to one or more use cases.
class ImageGalleryModuleViewModel {

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
        self.useCase = ImageGalleryModuleUseCase(interactor: ImageGalleryModuleInteractorApi())
        
        observeViewEffect()
    }
}

// MARK: - Public functions

extension ImageGalleryModuleViewModel {
    
    func bind(to viewAction: PublishRelay<ImageGalleryModuleViewAction>) {
        viewAction
            .asObservable()
            .subscribe(onNext: { [unowned self] viewAction in
                switch viewAction {
                case .someAction:
                    self.doSomething()
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Private functions

private extension ImageGalleryModuleViewModel {
    
    func doSomething() {
        self.useCase.verifySomething("")
            .subscribe(onNext: { [unowned self] status in
                switch status {
                case .someStatus:
                    self.viewEffect.accept(.someEffect)
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Rx

private extension ImageGalleryModuleViewModel {
    
    /// - Note: Privately observing view effects in the view model is meant to make the association between a specific effect and certain view states easier.
    private func observeViewEffect() {
        viewEffect
            .asObservable()
            .subscribe(onNext: { [unowned self] effect in
                switch effect {
                case .someEffect:
                    break
                }
            })
            .disposed(by: disposeBag)
    }
}
