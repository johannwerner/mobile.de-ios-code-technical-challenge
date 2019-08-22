import RxCocoa
import RxSwift

class MainImageConfigurator {
    
    // MARK: Dependencies
    
    let mainImageInteractor: MainImageInteractor
    
    init(mainImageInteractor: MainImageInteractor) {
        self.mainImageInteractor = mainImageInteractor
    }
}
