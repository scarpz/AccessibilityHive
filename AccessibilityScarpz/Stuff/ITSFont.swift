//
//  ITSFont.swift
//  ITSExtensions
//
//  Created by Nuno Cunha on 24/03/2019.
//  Copyright © 2019 ITSector. All rights reserved.
//

import UIKit

extension UIFont {
    
    /// Returns the light weight version of a
    /// given font.
    ///
    /// - Parameters:
    ///     - size: The desired font size.
    static func lightFont(size:CGFloat!) -> UIFont! {
        return UIFont.systemFont(ofSize: size, weight: .light)
    }
    
    /// Returns the regular weight version of a
    /// given font.
    ///
    /// - Parameters:
    ///     - size: The desired font size.
    static func regularFont(size:CGFloat!) -> UIFont! {
        return UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    /// Returns the bold weight version of a
    /// given font.
    ///
    /// - Parameters:
    ///     - size: The desired font size.
    static func boldFont(size:CGFloat!) -> UIFont! {
        return UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    /// Returns the given weight version of a
    /// given font.
    ///
    /// - Parameters:
    ///     - weight: The desired font weight.
    ///     - size: The desired font size.
    static func font(weight: UIFont.Weight, size: CGFloat!) -> UIFont {
        switch weight {
        case .light:
            return self.lightFont(size: size)
            
        case .regular:
            return self.regularFont(size: size)
            
        case .bold:
            return self.boldFont(size: size)
            
        default:
            return self.regularFont(size: size)
        }
    }
}
