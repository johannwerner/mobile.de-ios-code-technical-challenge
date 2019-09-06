import RxCocoa
import RxSwift

///
/// - Requires: `RxSwift`, `RxCocoa`
/// - Note: A view model can refer to one or more use cases.
final class IntroductionModuleViewModel {

// MARK: MvRx
    let viewEffect = PublishRelay< IntroductionModuleViewEffect>()
    
// MARK: Dependencies
    private let coordinator: IntroductionModuleCoordinator
    private let useCase: IntroductionModuleUseCase
    
// MARK: Tooling
    private let disposeBag = DisposeBag()

// MARK: - Life cycle
    
    init(
        coordinator: IntroductionModuleCoordinator,
        configurator: IntroductionModuleConfigurator
        ) {
        self.coordinator = coordinator
        self.useCase =  IntroductionModuleUseCase(interactor: configurator.introductionModuleInteractor)
        
        observeViewEffect()
    }
}

// MARK: - Public functions

extension  IntroductionModuleViewModel {
    
    func bind(to viewAction: PublishRelay< IntroductionModuleViewAction>) {
        viewAction
            .asObservable()
            .subscribe(onNext: { [unowned self] viewAction in
                switch viewAction {
                case .primaryButtonPressed:
                    self.fetchImages()
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Private functions

private extension  IntroductionModuleViewModel {
    
    func fetchImages() {
        self.useCase.fetchImages()
            .subscribe(onNext: { [unowned self] status in
                switch status {
                case .success(let model):
                    self.viewEffect.accept(.success)
                    self.showNextView(model: model)
                case .error:
                    self.viewEffect.accept(.error)
                case .loading:
                    self.viewEffect.accept(.loading)
                }
            })
            .disposed(by: disposeBag)
    }
    
    func showNextView(model: IntroductionImageGalleryModel) {
        coordinator.showImageGallery(
            model: model,
            animated: true
        )
    }
}

// MARK: - Rx

private extension  IntroductionModuleViewModel {
    
    /// - Note: Privately observing view effects in the view model is meant to make the association between a specific effect and certain view states easier.
    func observeViewEffect() {
        viewEffect
            .asObservable()
            .subscribe(onNext: { effect in
                switch effect {
                case .success: break
                case .loading: break
                case   .error: break
                }
            })
            .disposed(by: disposeBag)
    }
}
