import RxSwift
/// An introduction to the app
/// - Requires:
final class IntroductionModuleUseCase {
    
    // MARK: Dependencies
    private let interactor:  IntroductionModuleInteractor
    
    // MARK: - Life cycle
    
    init(interactor:  IntroductionModuleInteractor) {
        self.interactor = interactor
    }
}

// MARK: - Public functions

extension IntroductionModuleUseCase {
    func fetchImages() -> Observable<IntroductionModuleStatus> {
        return self.interactor.fetchImages()
            .map { (result: Async<Any>) -> IntroductionModuleStatus in
                switch result {
                case .loading:
                    return .loading
                case .success(let data):
                    guard let imageGalleryModel = IntroductionImageGalleryModel.parse(from: data) else {
                        return .error
                    }
                    return .success(imageGalleryModel)
                case .error:
                    return .error
                }
        }
    }
}
