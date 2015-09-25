//
//  DDPWeek.swift
//  PushIt
//
//  Created by Mann, Josh (US - Denver) on 9/25/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit

class DDPWeek: NSObject {
    var max:NSNumber?
    var startDate:NSDate?
    var endDate:NSDate?
    var day:[DDPDay]?
    
    //Memberwise initalizer
    init(dict:[String:AnyObject]) {
        super.init()
        self.updateWithDictionary(dict)
    }
    
    //MARK: NSCoding
    func updateWithDictionary(dict:[String:AnyObject]) {
        guard let newMax = dict["max"] as? NSNumber,
            let newStartDate = dict["startDate"] as? NSDate,
            let newEndDate = dict["endDate"] as? NSDate
        else {
                print("Error reading Challenge Dict")
                return
        }
        
        max  = newMax
        startDate = newStartDate
        endDate = newEndDate
        
        // create 7 days
        //days
    }
    
    func dictionaryRepresentation() -> [String:AnyObject]? {
        let dict:[String:AnyObject]? = nil
        
        // create json dictionary
        
        
        return dict;
    }

}
