import RxCocoa
import RxSwift

final class ImageGalleryModuleConfigurator {
    
    // MARK: Dependencies
    
    let imageGalleryModuleInteractor: ImageGalleryModuleInteractor
    init(imageGalleryModuleInteractor: ImageGalleryModuleInteractor) {
        self.imageGalleryModuleInteractor = imageGalleryModuleInteractor
    }
}
