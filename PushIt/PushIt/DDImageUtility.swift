//
//  DDImageUtility.swift
//  PushIt
//
//  Created by Ujwal Manjunath on 10/16/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    class func imageFromColor(color:UIColor) -> UIImage {
        let rect:CGRect = CGRectMake(0, 0, 100, 100)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}