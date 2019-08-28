import RxSwift
import RxAlamofire

/// Fetches images from the network for the use case of fetching car images and parsing it to ImageGalleryModel
/// - Requires: `RxSwift`, `Async`
final class ImageGalleryModuleInteractorApi: ImageGalleryModuleInteractor {
    
    // MARK: Dependencies
    
    // MARK: - Life cycle

    // MARK: - Internal
    
    func fetchImages() -> Observable<Async<Any>> {
        let url = ImageGalleryConstants.url

        let result = RxAlamofire
            .requestJSON(.get,
                         url,
                         parameters: nil)
            .flatMap { (response, json) -> Observable<Any> in
                return Observable.just(json)
            }.async()
        return result
    }
}
