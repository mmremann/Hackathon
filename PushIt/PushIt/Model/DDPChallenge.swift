//
//  DDPChallenge.swift
//  PushIt
//
//  Created by Mann, Josh (US - Denver) on 9/25/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit

class DDPChallenge: NSObject, NSCoding {
    
    var id:NSNumber?
    var startTime:NSDate?//time of day to start
    var endTime:NSDate?//time of day to end
    var week:[DDPWeek]?

    //Memberwise initalizer
    init(id:NSNumber, startTime:NSDate, endTime:NSDate, week:[DDPWeek]) {
        self.id = id
        self.startTime = startTime
        self.endTime = endTime
        self.week = week
    }
    
    //MARK: NSCoding
    required convenience init?(coder decoder: NSCoder) {
        guard let id = decoder.decodeObjectForKey("id") as? NSNumber,
            let startTime = decoder.decodeObjectForKey("startTime") as? NSDate,
            let endTime = decoder.decodeObjectForKey("endTime") as? NSDate,
            let week = decoder.decodeObjectForKey("week") as? [DDPWeek]
        else { return nil }
        
        self.init(
            id: id,
            startTime: startTime,
            endTime: endTime,
            week: week
        )
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.id, forKey: "id")
        coder.encodeObject(self.startTime, forKey: "startTime")
        coder.encodeObject(self.endTime, forKey: "endTime")
        coder.encodeObject(self.week, forKey: "week")
    }
}
