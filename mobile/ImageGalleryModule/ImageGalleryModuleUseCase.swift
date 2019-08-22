import RxSwift

/// <#Brief description of the purpose of the use case#>
/// - Requires: `RxSwift`, `Async`
class ImageGalleryModuleUseCase {
    
    // MARK: Dependencies
    private let interactor: ImageGalleryModuleInteractor
    
    // MARK: - Life cycle
    
    init(interactor: ImageGalleryModuleInteractor) {
        self.interactor = interactor
    }
}

// MARK: - Public functions

extension ImageGalleryModuleUseCase {
    
    func fetchImages() -> Observable<ImageGalleryModuleStatus> {
        return self.interactor.fetchImages()
            .map { (result: Async<Any>) -> ImageGalleryModuleStatus in
                switch result {
                case .loading:
                    return .loading
                case .success(let data):
                    guard let listOfArray = data as? Array<Dictionary<String, Any>> else {
                        return .error
                    }
                    let listOfModels = listOfArray.compactMap({ dictionary -> ImageGalleryModel? in
                        let imageGalleryModel = ImageGalleryModel.parse(from: dictionary)
                        return imageGalleryModel
                    })
                    return .success(listOfModels)
                case let .error(error):
                    return .error
                }
        }
    }
}
