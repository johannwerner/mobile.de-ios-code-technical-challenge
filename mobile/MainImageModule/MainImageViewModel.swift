import RxCocoa
import RxSwift

/// <#Brief description of the purpose of the view model#>
/// - Requires: `RxSwift`, `MvRx`
/// - Note: A view model can refer to one or more use cases.
class MainImageViewModel {

    // MARK: MvRx
    let viewEffect = PublishRelay<MainImageViewEffect>()
    
    // MARK: Dependencies
    private let coordinator: MainImageCoordinator
    private let useCase: MainImageUseCase
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()
    
    // MARK: - Properties
    let model: MainImageModel

    // MARK: - Life cycle
    
    init(coordinator: MainImageCoordinator,
         configurator: MainImageConfigurator,
         model: MainImageModel
        ) {
        self.coordinator = coordinator
        self.useCase = MainImageUseCase(interactor: configurator.mainImageInteractor)
        self.model = model
        observeViewEffect()
    }
}

// MARK: - Public functions

extension MainImageViewModel {

    var numberOfModels: Int {
        return model.models.count
    }
    
    func modelForIndex(index: Int) -> MainImageModel.ImageModel? {
        return model.models[safe: index]
    }
    
    func bind(to viewAction: PublishRelay<MainImageViewAction>) {
        viewAction
            .asObservable()
            .subscribe(onNext: { [unowned self] viewAction in
                switch viewAction {
                case .someAction:
                    break
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Private functions

private extension MainImageViewModel {}

// MARK: - Rx

private extension MainImageViewModel {
    
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
