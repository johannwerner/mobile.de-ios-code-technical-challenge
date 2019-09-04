/// Operation status enum for  IntroductionModule.
enum IntroductionModuleStatus {
    case error
    case loading
    case success(IntroductionImageGalleryModel)
}

/// View effect enum for IntroductionModule.
enum  IntroductionModuleViewEffect {
    case success
    case loading
}

/// View action enum for IntroductionModule.
enum  IntroductionModuleViewAction {
    case primaryButtonPressed
}

struct IntroductionConstants {
    static let titleLabelText = "Johann Werner"
    static var url: String = "https://m.mobile.de/svc/a/281794529"
}

struct IntroductionImageGalleryModel: Codable {
    
    var images: [Image]
    
    struct Image: Codable, ImageCollectionProtocol {
        var uri: String
        
        var smallImageUrl: String {
            return "http://\(uri)_2.jpg"
        }
        
        var bigImageUrl: String {
            return "http://\(uri)_27.jpg"
        }
        
        var imageUrlToShow: String {
            return smallImageUrl
        }
    }
    
}
