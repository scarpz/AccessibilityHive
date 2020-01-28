//
//  ITSString.swift
//  ITSTextfield Sample
//
//  Created by Nuno Cunha on 30/04/2019.
//  Copyright © 2019 ITSector. All rights reserved.
//

import Foundation

extension String {
    
    func number() -> NSNumber {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = kDecimalSeparator
        
        var amountWithPrefix = self
        
        // remove from String: "$"
        let regex = try! NSRegularExpression(pattern: "[^0-9,.]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")
        
        if let number = formatter.number(from: amountWithPrefix) {
            return number
        }
        
        return 0
        
    }
    
}
