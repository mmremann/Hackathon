//
//  DDPDay.swift
//  PushIt
//
//  Created by Mann, Josh (US - Denver) on 9/25/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit

class DDPDay: NSObject {
    var id:NSNumber?
    var frequency:NSNumber?
    var totalNumberOfPushUpsToday:NSNumber?
    var date:NSDate?
    var percentageOfMax:NSNumber?
    
    //Memberwise initalizer
    init(dict:[String:AnyObject]) {
        super.init()
        self.updateWithDictionary(dict)
    }
    
    //MARK: NSCoding
    func updateWithDictionary(dict:[String:AnyObject]) {
        guard let newId = dict["max"] as? NSNumber,
             newFrequency = dict["startDate"] as? NSNumber,
             newtotalNumberOfPushUpsToday = dict["endDate"] as? NSNumber,
             newDate = dict["endDate"] as? NSDate,
             newPercentageOfMax = dict["percentageOfMax"] as? NSNumber
        
        else {
                print("Error reading Challenge Dict")
                return
        }
        
        id = newId
        frequency = newFrequency
        totalNumberOfPushUpsToday = newtotalNumberOfPushUpsToday
        date = newDate
        percentageOfMax = newPercentageOfMax
    }
    
    func dictionaryRepresentation() -> [String:AnyObject]? {
        let dict:[String:AnyObject]? = nil
        
        // create json dictionary
        
        
        return dict;
    }

}
