//
//  UIColor+FromHex.swift
//  IbottaInterview
//
//  Created by Zach Vilardell on 11/7/17.
//  Copyright © 2017 zvilardell. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class func fromHex(string: String) -> UIColor {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        var hex: String = string
        
        //remove '#' prefix
        if hex.hasPrefix("#") {
            hex.removeFirst()
        }
        
        //scan hex string into hexValue
        let scanner = Scanner(string: hex)
        var hexValue: UInt64 = 0
        if scanner.scanHexInt64(&hexValue) {
            if hex.count == 6 {
                red   = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
                green = CGFloat((hexValue & 0x00FF00) >> 8) / 255.0
                blue  = CGFloat(hexValue & 0x0000FF) / 255.0
            } else if hex.count == 8 {
                red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                blue  = CGFloat((hexValue & 0x0000FF00) >> 8) / 255.0
                alpha = CGFloat(hexValue & 0x000000FF) / 255.0
            } else {
                print("Hex string must contain 6 or 8 digits")
            }
        } else {
            print("Could not scan hex string")
        }
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
