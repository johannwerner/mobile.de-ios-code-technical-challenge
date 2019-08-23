import UIKit
import RxCocoa
import RxSwift

/// <#Brief description of the purpose of the coordinator#>
/// - Requires: `RxSwift`
class MainImageCoordinator {

    // MARK: Dependencies
    private let navigationController: UINavigationController
    private let configurator: MainImageConfigurator
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    
    init(
        navigationController: UINavigationController,
        configurator: MainImageConfigurator
        ) {
        self.navigationController = navigationController
        self.configurator = configurator
    }
}

// MARK: - Navigation IN

extension MainImageCoordinator {
    
    func showLargeImage(model: MainImageModel, animated: Bool) {
        let viewModel = MainImageViewModel(
            coordinator: self,
            configurator: configurator,
            model: model
        )
        let viewController = MainImageViewController(viewModel: viewModel)
        navigationController.pushViewController(
            viewController,
            animated: animated
        )
    }
}

// MARK: - Navigation OUT

extension MainImageCoordinator {}
