import RxSwift

/// <#Brief description of the purpose of the interactor#>
/// - Requires: `RxSwift`
protocol ImageGalleryModuleInteractor {
    func fetchImages() -> Observable<Async<Any>> 
}
