//
//  ViewController.swift
//  PushIt
//
//  Created by Mann, Josh (US - Denver) on 9/25/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        registerSettingsAndCategories()
        scheduleNotification()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, withResponseInfo responseInfo: [NSObject : AnyObject], completionHandler: () -> Void) {

    }

    func registerSettingsAndCategories() {
        let categories = NSMutableSet()
        
        let acceptAction = UIMutableUserNotificationAction()
        acceptAction.title = NSLocalizedString("Accept", comment: "Accept challenge")
        acceptAction.identifier = "accept"
        acceptAction.activationMode = UIUserNotificationActivationMode.Background
        acceptAction.authenticationRequired = false
        
        let declineAction = UIMutableUserNotificationAction()
        declineAction.title = NSLocalizedString("Decline", comment: "Decline challenge")
        declineAction.identifier = "decline"
        declineAction.activationMode = UIUserNotificationActivationMode.Background
        declineAction.authenticationRequired = false
        
        let inviteCategory = UIMutableUserNotificationCategory()
        inviteCategory.setActions([acceptAction, declineAction],
            forContext: UIUserNotificationActionContext.Default)
        inviteCategory.identifier = "invitation"
        
        categories.addObject(inviteCategory)
        
        // Configure other actions and categories and add them to the set...
        
        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge], categories: (NSSet(set: categories) as? Set<UIUserNotificationCategory>))
        
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
    }
    
    func scheduleNotification() {
        let now: NSDateComponents = NSCalendar.currentCalendar().components([.Hour, .Minute], fromDate: NSDate())
        
        let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let date = cal.dateBySettingHour(now.hour, minute: now.minute + 1, second: 0, ofDate: NSDate(), options: NSCalendarOptions())
        let reminder = UILocalNotification()
        reminder.fireDate = date
        reminder.alertBody = "You can now reply with text"
        reminder.alertAction = "Cool"
        reminder.soundName = "sound.aif"
        reminder.category = "CATEGORY_ID"
        
        UIApplication.sharedApplication().scheduleLocalNotification(reminder)
        
        print("Firing at \(now.hour):\(now.minute+1)")
    }
}

