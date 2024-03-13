//
//  Fonts+Extension.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 12/03/24.
//

import UIKit

extension UIFont {
    
    enum nameFont {
        case modak
    
        func getFontName() -> String {
            switch self {
            case .modak:
                return "Modak"
            }
        }
    }
    
    
    static func customFontModak(nameFont: nameFont, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: nameFont.getFontName(), size: size) else {
            return UIFont.systemFont(ofSize: size, weight: .bold)
        }
        return font
    }
    
}
