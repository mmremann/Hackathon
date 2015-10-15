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
    
    class func AvenirBookObliqueWithSize(size:CGFloat) -> UIFont {
        let descriptor = UIFontDescriptor(name: "Avenir-BookOblique", size: size)
        return UIFont(descriptor: descriptor, size: size)
    }
    
    class func AvenirLightWithSize(size:CGFloat) -> UIFont {
        let descriptor = UIFontDescriptor(name: "Avenir-Light", size: size)
        return UIFont(descriptor: descriptor, size: size)
    }
    
    class func AvenirBookWithSize(size:CGFloat) -> UIFont {
        let descriptor = UIFontDescriptor(name: "Avenir-Book", size: size)
        return UIFont(descriptor: descriptor, size: size)
    }
    
    class func AvenirMediumWithSize(size:CGFloat) -> UIFont {
        let descritor = UIFontDescriptor(name: "Avenir-Medium", size: size)
        return UIFont(descriptor: descritor, size: size)
    }
    
    class func AvenirBlackWithSize(size:CGFloat) -> UIFont {
        let descriptor = UIFontDescriptor(name: "Avenir-Black", size: size)
        return UIFont(descriptor: descriptor, size: size)
    }
    
    class func HelveticaNeueRegualarWithSize(size:CGFloat) -> UIFont {
        let descriptor = UIFontDescriptor(name: "HelveticaNeue-Regular", size: size)
        return UIFont(descriptor: descriptor, size: size)
    }
    
}
