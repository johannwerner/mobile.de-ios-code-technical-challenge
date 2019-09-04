import RxSwift
protocol IntroductionModuleInteractor {
    func fetchImages() -> Observable<Async<Any>>
}
