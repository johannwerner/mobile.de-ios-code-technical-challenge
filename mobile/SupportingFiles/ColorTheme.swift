import UIKit

struct ColorTheme {}

// MARK: - Public Methods

extension ColorTheme {
    
    static var primaryAppColor: UIColor {
        return ColorTheme.colorWith(red: 101, green: 179, blue: 239)
    }
}

// MARK: - Private Methods
private extension ColorTheme {
    
    ///  Red/Blue /Green from 0 to 255 to what color. Do not use divide by /255 because this is being done here.
    static func colorWith(
        red: UInt8,
        green: UInt8,
        blue: UInt8,
        alpha: CGFloat = 1.0
        ) -> UIColor {
        return UIColor(
            red: CGFloat(red)/255
            , green: CGFloat(green)/255
            , blue: CGFloat(blue)/255
            , alpha: alpha
        )
    }
}
