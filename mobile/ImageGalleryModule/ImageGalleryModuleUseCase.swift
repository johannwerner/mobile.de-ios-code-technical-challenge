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
    
    func verifySomething(_ someInput: String) -> Observable<ImageGalleryModuleStatus> {
        return self.interactor.fetchImages()
            .map { (result: Async<Any>) -> ImageGalleryModuleStatus in
                switch result {
                case .loading:
                    break
                case .success:
                    return .someStatus
                case let .error(error):
                    break
                }
                fatalError()
        }
    }
}
