import RxSwift

/// Currently does nothing but exists for future use
/// - Requires: `RxSwift`, `Async`
final class MainImageUseCase {
    
    // MARK: Dependencies
    private let interactor: MainImageInteractor
    
    // MARK: - Life cycle
    
    init(interactor: MainImageInteractor) {
        self.interactor = interactor
    }
}

// MARK: - Public functions

extension MainImageUseCase {}
