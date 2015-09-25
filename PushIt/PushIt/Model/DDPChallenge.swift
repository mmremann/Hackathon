//
//  DDPChallenge.swift
//  PushIt
//
//  Created by Mann, Josh (US - Denver) on 9/25/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit

class DDPChallenge: NSObject {
    
    var id:NSNumber?
    var startDate:NSDate?//Date time of day to start
    var endDate:NSDate?//Date time of day to end
    var week:[DDPWeek]?
    
    //MARK: NSCoding
    init(dict:[String:AnyObject]) {
        super.init()
        self.updateWithDictionary(dict)
    }
    
    func updateWithDictionary(dict:[String:AnyObject]) {
        guard let newId = dict["id"] as? NSNumber,
            let newStartDate = dict["startT"] as? NSDate,
            let newEndDate = dict["endTime"] as? NSDate
        else {
            print("Error reading Challenge Dict")
            return
        }
        
        id  = newId
        startDate = newStartDate
        endDate = newEndDate
        
        // create two weeks
        //week = newWeek
    }
    
    func dictionaryRepresentation() -> [String:AnyObject]? {
        let dict:[String:AnyObject]? = nil
        
        // create json dictionary
        
        
        return dict;
    }
}
