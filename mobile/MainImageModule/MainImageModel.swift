/// View state structure for MainImage.
struct MainImageViewState: Equatable {
    
    var isSomeButtonHidden: Bool
    
    static var initial: MainImageViewState {
        return MainImageViewState(
            isSomeButtonHidden: true
        )
    }
}

/// Operation status enum for MainImage.
enum MainImageStatus {
    case someStatus
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
    var bigImageUrl: String
}
