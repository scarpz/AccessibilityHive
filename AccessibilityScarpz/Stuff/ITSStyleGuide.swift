//
//  ITSStyleGuide.swift
//  ITSThemeManager
//
//  Created by Nuno Cunha on 07/04/2019.
//  Copyright © 2019 ITSector. All rights reserved.
//

import UIKit


struct StyleManagerKeys {

    /// Set the project colors.
    /// These are normaly provided by the design team
    private struct ClientColors {
        static let white = ITSStyleGuide.rgbColor(r: 255, g: 255, b: 255)
        static let main = ITSStyleGuide.rgbColor(r: 63, g: 87, b: 105)
        static let darkGray = ITSStyleGuide.rgbColor(r: 65, g: 67, b: 69)
        static let mediumGray = ITSStyleGuide.rgbColor(r: 175, g: 175, b: 175)
        static let red = ITSStyleGuide.rgbColor(r: 192, g: 57, b: 57)
    }
    
    /// Set the project colors.
    /// These are normaly provided by the design team
    ///
    /// To print all fonts and check your custom Font name:
    /// UIFont.familyNames.forEach({ familyName in
    /// let fontNames = UIFont.fontNames(forFamilyName: familyName)
    /// print(familyName, fontNames)
    /// })
    private struct ClientFonts {
        static let ITSLightWeightFont = "Montserrat-Light"
        static let ITSRegularWeightFont = "Montserrat-Regular"
        static let ITSBoldWeightFont = "Montserrat-Bold"
        static let ITSSecondLightWeightFont = "Helvetica-Light"
        static let ITSSecondRegularWeightFont = "Helvetica-Regular"
        static let ITSSecondBoldWeightFont = "Helvetica-Bold"
    }
    
    static let ITSButtonAttributeBackgroundColor = "buttonBackgroundColor"
    static let ITSButtonAttributeTextColor = "buttonTextColor"
    static let ITSButtonAttributeTextFont = "buttonFont"
    static let ITSButtonAttributeBorderColor = "buttonBorderColor"
    static let ITSButtonAttributeCornerRadius = "buttonRoundCorners"
    
    static var mainLightFont = ClientFonts.ITSLightWeightFont
    static var mainRegularFont = ClientFonts.ITSRegularWeightFont
    static var mainBoldFont = ClientFonts.ITSBoldWeightFont
    static var secondLightFont = ClientFonts.ITSSecondLightWeightFont
    static var secondRegularFont = ClientFonts.ITSSecondRegularWeightFont
    static var secondBoldFont = ClientFonts.ITSSecondBoldWeightFont
    
    static var mainClientColor = ClientColors.main
    static var mainClientRed = ClientColors.red
    static var mainWhite = ClientColors.white
    static var mainGray = ClientColors.darkGray
    static var secondaryGray = ClientColors.mediumGray
    
}

class ITSStyleGuide {
    typealias ButtonStyle = String
    typealias TextStyle = String
    
    static let shared = ITSStyleGuide()
    
    private var appColors = [String: UIColor]()
    private var buttonStyles = [String: Dictionary<String, Any>]()
    private var textStyles = [String: String]()
    private var appFonts = [String: String]()
    
    private init() {
        
        appColors = ["white" : StyleManagerKeys.mainWhite,
                     "black" : StyleManagerKeys.mainGray,
                     "red" : StyleManagerKeys.mainClientRed,
                     "mainGray" : StyleManagerKeys.mainGray]
        
        appFonts = ["MainRegular" : StyleManagerKeys.mainRegularFont,
                    "MainLight" : StyleManagerKeys.mainLightFont,
                    "MainBold" : StyleManagerKeys.mainBoldFont,
                    "SecondRegular" : StyleManagerKeys.secondRegularFont,
                    "SecondLight" : StyleManagerKeys.secondLightFont,
                    "SecondBold" : StyleManagerKeys.secondBoldFont]
        
        textStyles = ["Heading" : "blackMainBold-30",
                      "Heading2" : "blackMainBold-20",
                      "Heading3" : "blackMainBold-16",
                      "Body" : "blackMainRegular-14",
                      "Disclaimer" : "mainGrayMainRegular-13",
                      "BottomError" : "redMainRegular-12"]
        
        buttonStyles = [ "primaryButton" : [StyleManagerKeys.ITSButtonAttributeTextFont : UIFont.boldFont(size: 14),
                                            StyleManagerKeys.ITSButtonAttributeCornerRadius : CGFloat(30),
                                            StyleManagerKeys.ITSButtonAttributeTextColor : StyleManagerKeys.mainWhite,
                                            StyleManagerKeys.ITSButtonAttributeBackgroundColor : StyleManagerKeys.mainClientColor],
                         
                         "secondaryButton" : [StyleManagerKeys.ITSButtonAttributeTextFont : UIFont.regularFont(size: 14) as Any,
                                              StyleManagerKeys.ITSButtonAttributeCornerRadius : CGFloat(30),
                                              StyleManagerKeys.ITSButtonAttributeTextColor : StyleManagerKeys.mainClientColor,
                                              StyleManagerKeys.ITSButtonAttributeBackgroundColor : UIColor.clear as Any,
                                              StyleManagerKeys.ITSButtonAttributeBorderColor : StyleManagerKeys.mainClientColor],
                         
                         "clearButton" : [StyleManagerKeys.ITSButtonAttributeTextFont : UIFont.regularFont(size: 14) as Any,
                                          StyleManagerKeys.ITSButtonAttributeTextColor : StyleManagerKeys.mainClientColor,
                                          StyleManagerKeys.ITSButtonAttributeBackgroundColor : UIColor.clear as Any]
        ]
        
    }
    
    static func rgbColor(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    public func buttonAttributesDictionary(style: ButtonStyle) -> Dictionary<String, Any> {
        return buttonStyles[style] as! [String: Any]
    }
    
    public func styleAttributes(style: TextStyle) -> String {
        return textStyles[style] ?? ""
    }
    
    public func textAttributesDictionary(theme:String) -> Dictionary<String, Any> {
        guard let themeSize = fontSize(theme: theme) else {
            fatalError("\n\n\n💩❌❌ Font Size can't be 0!!\n\nPlease confirm the theme attribute \(theme)\n\n\n")
        }
        
        let themeColor = fontColor(theme: theme)
        let themeFont = fontName(theme:theme)
        
        var themeAttributes = Dictionary<String, Any>()
        
        if let themeFontFile = UIFont.init(name: themeFont, size: themeSize) {
            themeAttributes = ["textColor":themeColor,
                               "font":themeFontFile]
        } else {
            themeAttributes = ["textColor":themeColor,
                               "font":UIFont.systemFont(ofSize: themeSize)]
        }
        
        return themeAttributes
        
    }
    
    public func fontSize(theme:String) -> CGFloat? {
        let splitedStr = theme.split(separator: "-", maxSplits: 1, omittingEmptySubsequences: false)
        let sizeStr = String(splitedStr[1])
        
        if let size = NumberFormatter().number(from: sizeStr) {
            return CGFloat(truncating: size)
        } else {
            return nil
        }
        
    }
    
    private func fontName(theme:String) -> String {
        var themeFont : String?
        
        let availableFonts = Array(appFonts.keys)
        
        for fontName in availableFonts {
            if theme.range(of: fontName) != nil {
                themeFont = fontName
            }
        }
        
        if let themeFont = themeFont {
            return appFonts[themeFont]!
        } else {
            return appFonts[availableFonts.last!]!
        }
    }
    
    private func fontColor(theme:String) -> UIColor {
        var themeColor = UIColor()
        
        let availableColors = Array(appColors.keys)
        
        for colorName in availableColors {
            if theme.range(of: colorName) != nil {
                themeColor = appColors[colorName]!
            }
        }
        
        return themeColor
    }
}
