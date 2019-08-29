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
        red: CGFloat,
        green: CGFloat,
        blue: CGFloat,
        alpha: CGFloat = 1.0
        ) -> UIColor {
        return UIColor(
            red: red/255,
            green: green/255,
            blue: blue/255,
            alpha: alpha
        )
    }
}
