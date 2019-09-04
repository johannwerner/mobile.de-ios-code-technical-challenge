import RxSwift
import RxAlamofire
///
/// - Requires:
final class IntroductionModuleInteractorApi: IntroductionModuleInteractor {
    
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

