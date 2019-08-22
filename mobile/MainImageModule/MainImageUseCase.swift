import RxSwift

/// <#Brief description of the purpose of the use case#>
/// - Requires: `RxSwift`, `Async`
class MainImageUseCase {
    
    // MARK: Dependencies
    private let interactor: MainImageInteractor
    
    // MARK: - Life cycle
    
    init(interactor: MainImageInteractor) {
        self.interactor = interactor
    }
}

// MARK: - Public functions

extension MainImageUseCase {}
