//
//  UIColor+Helpers.swift
//  CounterStriker
//
//  Created by André  Costa Dantas on 03/11/22.
//

import Foundation
import UIKit

extension UIColor {
    
    class var heavyOrangeColor: UIColor {
        return UIColor.init(named: "HeavyOrangeColor")!
    }
    
    class var lightOrangeColor: UIColor {
        return UIColor.init(named: "LightOrangeColor")!
    }
    
    class var accentColor: UIColor {
        return UIColor.init(named: "AccentColor")!
    }
    
    class var randomColor: UIColor {
        let salmonColor = UIColor.init(r: 255, g: 95, b: 88)
        let orangeColor = UIColor.init(r: 250, g: 153, b: 23)
        let yellowColor = UIColor.init(r: 243, g: 202, b: 62)
        let greenColor = UIColor.init(r: 42, g: 201, b: 64)
        let lightBlueColor = UIColor.init(r: 51, g: 153, b: 255)
        let cyanColor = UIColor.init(r: 51, g: 225, b: 255)
        let pinkColor = UIColor.init(r: 255, g: 51, b: 102)
        let lightGrayColor = UIColor.lightGray
        let purpleColor = UIColor.purple
        let primaryRedColor = UIColor.heavyOrangeColor
        
        let colors = [salmonColor, orangeColor, yellowColor, greenColor, lightBlueColor, cyanColor, pinkColor, lightGrayColor, purpleColor, primaryRedColor]
        
        if let pickedColor = colors.randomElement() {
            return pickedColor
        }
        return UIColor.brown
    }
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}
