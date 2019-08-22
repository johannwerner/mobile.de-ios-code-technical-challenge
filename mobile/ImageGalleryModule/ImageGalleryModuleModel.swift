/// Operation status enum for ImageGalleryModule.
enum ImageGalleryModuleStatus {
    case error
    case loading
    case success([ImageGalleryModel])
}

/// View effect enum for ImageGalleryModule.
enum ImageGalleryModuleViewEffect {
    case showImages
}

/// View action enum for ImageGalleryModule.
enum ImageGalleryModuleViewAction {
    case showImages
    case selectedIndex(Int)
}

struct ImageGalleryConstants {
    static var url: String = "https://m.mobile.de/svc/a/281794529"
    static var imagesKeyValue = "images"
}
