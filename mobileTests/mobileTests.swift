import XCTest
@testable import mobile

class mobileTests: XCTestCase {
    
    // MARK: - Properties
    var useCase: ImageGalleryModuleUseCase!
    
    // MARK: - Life Cycle
    override func setUp() {
        super.setUp()
        let interactor = ImageGalleryTestInteractor()
        let useCase = ImageGalleryModuleUseCase(interactor: interactor)
        self.useCase = useCase
    }
    
    override func tearDown() {
        super.tearDown()
        useCase = nil
    }
}

extension mobileTests {
    func test_parsingOfImages_uri() {
        //Given
        let testUri = "https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/SB_8277397.jpg/150px-SB_8277397.jpg"
        let result = self.useCase.fetchImages()
            .subscribe(onNext: { status in
                switch status {
                case .loading:
                    break
                case .error:
                    break
                case .success(let imageModel):
                    //When
                    let model = imageModel.first!
                    //Then
                    XCTAssertEqual(model.uri, testUri)
                }
                
            })
        print(result)
    }
}
