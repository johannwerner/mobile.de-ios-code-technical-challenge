import RxSwift

/// Protocol for fetching images for Image Gallery
/// - Requires: `RxSwift`
protocol ImageGalleryModuleInteractor {
    func fetchImages() -> Observable<Async<Any>> 
}
