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
        let imageGalleryModel = ImageGalleryModel(introductionModel: model)
        coordinator.showImageGallery(
            model: imageGalleryModel,
            animated: true
        )
    }
}

// MARK: - ImageGalleryDependcy
private extension ImageGalleryModel {
    
    init(introductionModel: IntroductionImageGalleryModel) {
        let images = introductionModel.images.map { image -> ImageGalleryModel.Image in
            return ImageGalleryModel.Image(introductionModelImage: image)
        }
        let model = ImageGalleryModel(images: images)
        self = model
    }
}

private extension ImageGalleryModel.Image {
    
    init(introductionModelImage: IntroductionImageGalleryModel.Image) {
        let model = ImageGalleryModel.Image(uri: introductionModelImage.uri)
        self = model
    }
}
