//
//  UIFont.swift
//  Barcodrop
//
//  Created by SG on 2022/01/31.
//

import UIKit

extension UIFont {
    public enum FontType: String {
        case extraBold = "EB"
        case bold = "B"
        case regular = "R"
        case light = "L"
    }

    static func DefaultFont(_ type: FontType, size: CGFloat) -> UIFont {
        return UIFont(name: "NanumSquareOTF\(type.rawValue)", size: size)!
    }
    static func RoundFont(_ type: FontType, size: CGFloat) -> UIFont {
        return UIFont(name: "NanumSquareRoundOTF\(type.rawValue)", size: size)!
    }
}
