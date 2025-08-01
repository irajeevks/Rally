import Foundation
import UIKit
import SwiftUI

extension UIFont {
    static func printAllFontFamily() {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
}

enum AppFont {
    case thin
    case regular
    case medium
    case bold
    
    var fontName: String {
        switch self {
        case .thin:
            "Kuunari-Thin"
        case .regular:
            "Kuunari-Regular"
        case .medium:
            "Kuunari-Medium"
        case .bold:
            "Kuunari-Bold"
        }
    }
}

extension Font {
    static func appFont(_ weight: AppFont, size: CGFloat) -> Font {
        Font.custom(weight.fontName, size: size)
    }
    
    static func appFont(_ weight: AppFont, fixedSize: CGFloat) -> Font {
        Font.custom(weight.fontName, fixedSize: fixedSize)
    }
}
