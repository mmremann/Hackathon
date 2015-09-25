//
//  DDPWeek.swift
//  PushIt
//
//  Created by Mann, Josh (US - Denver) on 9/25/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit

class DDPWeek: NSObject, NSCoding {
    var max:NSNumber?
    var startDate:NSDate?
    var endDate:NSDate?
    var day:[DDPDay]?
    
    //Memberwise initalizer
    init(max:NSNumber, startDate:NSDate, endDate:NSDate, day:[DDPDay]) {
        self.max = max
        self.startDate = startDate
        self.endDate = endDate
        self.day = day
    }
    
    //MARK: NSCoding
    required convenience init?(coder decoder: NSCoder) {
        guard let max = decoder.decodeObjectForKey("max") as? NSNumber,
            let startDate = decoder.decodeObjectForKey("startDate") as? NSDate,
            let endDate = decoder.decodeObjectForKey("endDate") as? NSDate,
            let day = decoder.decodeObjectForKey("day") as? [DDPDay]
            else { return nil }
        
        self.init(
            max: max,
            startDate: startDate,
            endDate: endDate,
            day: day
        )
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.max, forKey: "max")
        coder.encodeObject(self.startDate, forKey: "startDate")
        coder.encodeObject(self.endDate, forKey: "endDate")
        coder.encodeObject(self.day, forKey: "day")
    }

}
