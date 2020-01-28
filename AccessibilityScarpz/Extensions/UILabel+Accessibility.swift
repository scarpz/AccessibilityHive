//
//  UILabel+Accessibility.swift
//  AccessibilityScarpz
//
//  Created by Felipe Scarpitta on 27/01/2020.
//  Copyright © 2020 scarpz. All rights reserved.
//

import UIKit

extension UILabel {
    
    @IBInspectable var dynamicTheme: String {
        set {
            let fontName = newValue.components(separatedBy: "_")[0]
            let fontSize = CGFloat(Int(newValue.components(separatedBy: "_")[1]) ?? 17)

            let newFont = UIFont(name: fontName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
            self.dynamicFont = newFont
        }
        
        get {
            return self.dynamicTheme
        }
    }
    
    var dynamicFont: UIFont {
        set {
            
            self.numberOfLines = 0
            
             if #available(iOS 10.0, *) {
                // Real-time size update
                self.adjustsFontForContentSizeCategory = true
             }
            
            let fontMetrics = UIFontMetrics(forTextStyle: .body)
            self.font = fontMetrics.scaledFont(for: newValue)
        }
        
        get {
            return self.font
        }
    }
}
