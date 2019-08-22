import UIKit
import RxCocoa
import RxSwift

/// <#Brief description of the purpose of the coordinator#>
/// - Requires: `RxSwift`
class ImageGalleryModuleCoordinator {

    // MARK: Dependencies
    private let navigationController: UINavigationController
    private let configurator: ImageGalleryModuleConfigurator
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    
    init(navigationController: UINavigationController, configurator: ImageGalleryModuleConfigurator) {
        self.navigationController = navigationController
        self.configurator = configurator
    }
}

// MARK: - Navigation IN

extension ImageGalleryModuleCoordinator {
    
    func showImageGallery(animated: Bool) {
        let viewModel = ImageGalleryModuleViewModel(coordinator: self, configurator: configurator)
        let viewController = ImageGalleryModuleViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: animated)
    }
}

// MARK: - Navigation OUT

extension ImageGalleryModuleCoordinator {
    func showLargeImage(imageGalleryModel: ImageGalleryModel, animted: Bool) {
        
    }
}
