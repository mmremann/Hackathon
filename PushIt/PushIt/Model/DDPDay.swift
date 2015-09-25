//
//  DDPDay.swift
//  PushIt
//
//  Created by Mann, Josh (US - Denver) on 9/25/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit

class DDPDay: NSObject, NSCoding {
    var id:NSNumber?
    var frequency:NSNumber?
    var totalNumberOfPushUpsToday:NSNumber?
    var date:NSDate?
    var percentageOfMax:NSNumber?
    
    //Memberwise initalizer
    init(id:NSNumber, frequency:NSNumber, totalNumberOfPushUpsToday:NSNumber, date:NSDate, percentageOfMax:NSNumber) {
        self.id = id
        self.frequency = frequency
        self.totalNumberOfPushUpsToday = totalNumberOfPushUpsToday
        self.date = date
        self.percentageOfMax = percentageOfMax
    }
    
    //MARK: NSCoding
    required convenience init?(coder decoder: NSCoder) {
        guard let id = decoder.decodeObjectForKey("id") as? NSNumber,
            let frequency = decoder.decodeObjectForKey("frequency") as? NSNumber,
            let totalNumberOfPushUpsToday = decoder.decodeObjectForKey("totalNumberOfPushUpsToday") as? NSNumber,
            let date = decoder.decodeObjectForKey("date") as? NSDate,
            let percentageOfMax = decoder.decodeObjectForKey("percentageOfMax") as? NSNumber
            else { return nil }
        
        self.init(
            id: id,
            frequency: frequency,
            totalNumberOfPushUpsToday: totalNumberOfPushUpsToday,
            date: date,
            percentageOfMax: percentageOfMax
        )
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.id, forKey: "id")
        coder.encodeObject(self.frequency, forKey: "frequency")
        coder.encodeObject(self.totalNumberOfPushUpsToday, forKey: "totalNumberOfPushUpsToday")
        coder.encodeObject(self.date, forKey: "date")
        coder.encodeObject(self.percentageOfMax, forKey: "percentageOfMax")
    }
}
