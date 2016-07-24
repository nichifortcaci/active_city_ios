//
//  Extension.swift
//  active_city
//
//  Created by Eugen Dascal on 7/24/16.
//  Copyright © 2016 Syrbu Konstantin. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
     
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    public class func alb() -> UIColor {
        
        return UIColor(netHex: 0xFFFFFF)
    }
    
}