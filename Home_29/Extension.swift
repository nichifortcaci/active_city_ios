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
    
    public class func colorPrimary() -> UIColor {
        
        return UIColor(netHex: 0xF303F9F)
    }
    
    public class func colorPrimaryDark() -> UIColor {
        
        return UIColor(netHex: 0x3F51B5)
    }
    
    public class func colorAccent() -> UIColor {
        
        return UIColor(netHex: 0xFF9800)
    }
    
    public class func toolbar_text_color() -> UIColor {
        
        return UIColor(netHex: 0xffffff)
    }
    
    public class func text_like_counter() -> UIColor {
        
        return UIColor(netHex: 0x2b5a83)
    }
    
    public class func fab_color_pressed() -> UIColor {
        
        return UIColor(netHex: 0x007787)
    }
    
    public class func fab_color_shadow() -> UIColor {
        
        return UIColor(netHex: 0x44000000)
    }
   
    
    public class func btn_default_light_normal() -> UIColor {
        
        return UIColor(netHex: 0x00000000)
    }
    
    public class func btn_default_light_pressed() -> UIColor {
        
        return UIColor(netHex: 0x40ffffff)
    }
    
    public class func btn_send_normal() -> UIColor {
        
        return UIColor(netHex: 0x02c754)
    }
    
    public class func btn_send_pressed() -> UIColor {
        
        return UIColor(netHex: 0x006633)
    }
    
    public class func btn_default_shadow() -> UIColor {
        
        return UIColor(netHex: 0x99000000)
    }
    
    public class func btn_context_menu_normal() -> UIColor {
        
        return UIColor(netHex: 0xffffff)
    }
    
    public class func btn_context_menu_pressed() -> UIColor {
        
        return UIColor(netHex: 0x40000000)
    }
    
    public class func btn_context_menu_text_red() -> UIColor {
        
        return UIColor(netHex: 0xffff0000)
    }
    
    
}