//
//  DDFont.swift
//  PushIt
//
//  Created by Ujwal Manjunath on 10/15/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    class func KnockoutHTF27JuniorBantamWithSize(size:CGFloat) -> UIFont {
        let descriptor = UIFontDescriptor(name: "Avenir-BookOblique", size: size)
        return UIFont(descriptor: descriptor, size: size)
    }
    
    class func KnockoutHTF30JuniorWelterWithSize(size:CGFloat) -> UIFont {
        let descriptor = UIFontDescriptor(name: "Avenir-Light", size: size)
        return UIFont(descriptor: descriptor, size: size)
    }
    
}
