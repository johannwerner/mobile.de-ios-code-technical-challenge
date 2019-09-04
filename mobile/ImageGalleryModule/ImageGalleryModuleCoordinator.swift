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
    
    init(
        navigationController: UINavigationController,
        configurator: ImageGalleryModuleConfigurator
        ) {
        self.navigationController = navigationController
        self.configurator = configurator
    }
}

// MARK: - Navigation IN

extension ImageGalleryModuleCoordinator {
    
    func showImageGallery(model: ImageGalleryModel, animated: Bool) {
        let viewModel = ImageGalleryModuleViewModel(
            coordinator: self,
            configurator: configurator,
            model: model
        )
        let viewController = ImageGalleryModuleViewController(viewModel: viewModel)
        navigationController.pushViewController(
            viewController,
            animated: animated
        )
    }
}

// MARK: - Navigation OUT

extension ImageGalleryModuleCoordinator {
    func showLargeImage(imageGalleryModel: ImageGalleryModel, selectedIndex: Int, animted: Bool) {
        let model = MainImageModel(
            imageGalleryModel: imageGalleryModel,
            selectedIndex: selectedIndex
        )
        let interactor = MainImageInteractorApi()
        let configurator = MainImageConfigurator(mainImageInteractor: interactor)
        
        let coordinator = MainImageCoordinator(
            navigationController: navigationController,
            configurator: configurator
        )
        
        coordinator.showLargeImage(
            model: model,
            animated: true
        )
    }
}

// MARK: - MainImageModel Dependancy
private extension MainImageModel {
    init(
        imageGalleryModel: ImageGalleryModel,
        selectedIndex: Int
        ) {
        let mainImageModels = imageGalleryModel.images.compactMap { imageGalleryModel -> MainImageModel.ImageModel? in
            return MainImageModel.ImageModel(bigImageUrl: imageGalleryModel.bigImageUrl)
        }
        let model = MainImageModel(
            selectedIndex: selectedIndex,
            models: mainImageModels
        )
        self = model
    }
}

private extension MainImageModel.ImageModel {
    init(imageGalleryModel: ImageGalleryModel.Image) {
        let model = MainImageModel.ImageModel(bigImageUrl: imageGalleryModel.bigImageUrl)
        self = model
    }
}
