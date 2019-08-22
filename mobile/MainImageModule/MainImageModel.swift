/// Operation status enum for MainImage.
enum MainImageStatus {
    case loading
}

/// View effect enum for MainImage.
enum MainImageViewEffect {
    case someEffect
}

/// View action enum for MainImage.
enum MainImageViewAction {
    case someAction
}

struct MainImageModel {

    var selectedIndex: Int
    var models: [ImageModel]

    
    struct ImageModel: ImageCollectionProtocol {
        var bigImageUrl: String
        
        var imageUrlToShow: String {
            return bigImageUrl
        }
    }
    
    var selectedModel: MainImageModel.ImageModel? {
        return models[safe: selectedIndex]
    }
}
