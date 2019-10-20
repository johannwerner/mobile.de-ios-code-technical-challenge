import UIKit

/// Entry point into app to introduce the app
/// - Requires: `UIKit`
final class IntroductionModuleCoordinator {

    // MARK: Dependencies
    private let navigationController: UINavigationController
    private let configurator: IntroductionModuleConfigurator
    
    // MARK: Tooling

    // MARK: - Life cycle
    
    init(
        navigationController: UINavigationController,
        configurator: IntroductionModuleConfigurator
        ) {
        self.navigationController = navigationController
        self.configurator = configurator
    }
}

// MARK: - Navigation IN

extension IntroductionModuleCoordinator {
    
    func showIntroduction(animated: Bool) {
        let viewModel =  IntroductionModuleViewModel(
            coordinator: self,
            configurator: configurator
        )
        let viewController =  IntroductionModuleViewController(viewModel: viewModel)
        navigationController.pushViewController(
            viewController,
            animated: animated
        )
    }
}

// MARK: - Navigation OUT

// MARK: - ImageGalleryDependency
extension IntroductionModuleCoordinator {

    func showImageGallery(
        model: IntroductionImageGalleryModel,
        animated: Bool
        ) {

        let interactor = ImageGalleryModuleInteractorApi()
        let configurator = ImageGalleryModuleConfigurator(imageGalleryModuleInteractor: interactor)
        let coordinator = ImageGalleryModuleCoordinator(
            navigationController: navigationController,
            configurator: configurator
        )
        let imageGalleryItem = ImageGalleryItem(introductionModel: model)
        coordinator.showImageGallery(
            model: imageGalleryItem,
            animated: true
        )
    }
}

private extension ImageGalleryItem {
    
    init(introductionModel: IntroductionImageGalleryModel) {
        let images = introductionModel.images.map { image -> ImageGalleryItem.Image in
            return ImageGalleryItem.Image(introductionModelImage: image)
        }
        self.init(images: images)
    }
}

private extension ImageGalleryItem.Image {
    
    init(introductionModelImage: IntroductionImageGalleryModel.Image) {
        self.init(uri: introductionModelImage.uri)
    }
}
