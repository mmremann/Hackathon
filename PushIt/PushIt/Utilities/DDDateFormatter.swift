//
//  DDDateFormatter.swift
//  PushIt
//
//  Created by Ujwal Manjunath on 9/25/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import Foundation

//
//  HTSDDateFormatter.swift
//  HowToSpeakDoctor
//
//  Created by Ujwal Manjunath on 8/30/15.
//  Copyright © 2015 HowToSpeakDoctor. All rights reserved.
//

import Foundation
import UIKit

extension NSDateFormatter {
    
    class func DDFormattedDateFromString(dateString:String) -> NSDate? {
        
        let dateFormatter = NSDateFormatter()
        let enUSPosixLocale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.locale = enUSPosixLocale
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.dateFromString(dateString)
        return date
        
    }
    
    class func DDFormattedStringFromDate(date:NSDate) -> String? {
        
        let dateFormatter = NSDateFormatter()
        let enUSPosixLocale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.locale = enUSPosixLocale
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let string = dateFormatter.stringFromDate(date)
        return string
    }
    
    class func DDStringFromDate(date:NSDate, forFormat format:String) -> String? {
        let dateFormatter = NSDateFormatter()
        let enUSPosixLocale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.locale = enUSPosixLocale
        dateFormatter.dateFormat = format
        let string = dateFormatter.stringFromDate(date)
        return string
    }
}