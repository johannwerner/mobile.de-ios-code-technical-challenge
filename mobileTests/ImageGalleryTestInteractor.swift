import RxSwift
@testable import mobile

final class ImageGalleryTestInteractor: ImageGalleryModuleInteractor {

    // MARK: Dependencies
    
    
    // MARK: - Life cycle
}

extension ImageGalleryTestInteractor {
    
    // MARK: - Internal
    
    func fetchImages() -> Observable<Async<Any>> {
        let dictionary: [String : Any] = [
            "uri": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/SB_8277397.jpg/150px-SB_8277397.jpg"
        ]
        return Observable.just([dictionary]).async()

    }
//    func getListOfCarsForLocation(location: String) -> Observable<Async<Any>> {
//    }
}
