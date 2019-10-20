/// Operation status enum for  IntroductionModule.
enum IntroductionModuleStatus {
    case error
    case loading
    case success(IntroductionImageGalleryModel)
}

/// View effect enum for IntroductionModule.
enum  IntroductionModuleViewEffect {
    case error
    case success
    case loading
}

/// View action enum for IntroductionModule.
enum  IntroductionModuleViewAction {
    case primaryButtonPressed
}

struct IntroductionConstants {
    static let titleLabelText: String = "Johann Werner"
    static var url: String = "https://m.mobile.de/svc/a/281794529"
    static var localizedName: String = "IntroductionModule"
}

struct IntroductionImageGalleryModel: Codable {
    
    var images: [Image]
    
    struct Image: Codable {
        var uri: String
    }
}
