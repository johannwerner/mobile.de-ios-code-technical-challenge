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
        let model = MainImageModel(imageGalleryModel: imageGalleryModel)
        let interactor = MainImageInteractorApi()
        let configurator = MainImageConfigurator(mainImageInteractor: interactor)
        
        let coordinator = MainImageCoordinator(navigationController: navigationController, configurator: configurator)
        
        coordinator.showLargeImage(
            models: [model],
            animated: true
        )
    }
}

// MARK: - MainImageModel Dependancy
private extension MainImageModel {
    init(imageGalleryModel: ImageGalleryModel) {
        let model = MainImageModel(bigImageUrl: imageGalleryModel.bigImageUrl)
        self = model
    }
}
