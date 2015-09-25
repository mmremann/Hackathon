//
//  AppDelegate.swift
//  PushIt
//
//  Created by Mann, Josh (US - Denver) on 9/25/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        setupNotifications(application)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //MARK: - Notifications
    
    private func setupNotifications(application:UIApplication) {
        
        let nopeLazyAction = UIMutableUserNotificationAction()
        nopeLazyAction.identifier = "nopeiamlazy"
        nopeLazyAction.title = "Nope, i'm lazy"
        nopeLazyAction.activationMode = UIUserNotificationActivationMode.Foreground
        nopeLazyAction.authenticationRequired = false
        
        let notQuiteAction = UIMutableUserNotificationAction()
        notQuiteAction.identifier = "notquite"
        notQuiteAction.title = "Not quite..."
        notQuiteAction.activationMode = UIUserNotificationActivationMode.Foreground
        notQuiteAction.authenticationRequired = false
        
        let yesAction = UIMutableUserNotificationAction()
        yesAction.identifier = "yes!"
        yesAction.title = "YES!"
        yesAction.activationMode = UIUserNotificationActivationMode.Foreground
        yesAction.authenticationRequired = false
        
        let reminderCategory = UIMutableUserNotificationCategory()
        reminderCategory.identifier = "PushUpReminder"
        reminderCategory.setActions(nil, forContext: UIUserNotificationActionContext.Default)
        
        let detectedCategory = UIMutableUserNotificationCategory()
        detectedCategory.identifier = "PushUpDetected"
        detectedCategory.setActions([yesAction,notQuiteAction], forContext: UIUserNotificationActionContext.Default)
        
        let doneCategory = UIMutableUserNotificationCategory()
        doneCategory.identifier = "PushUpDone"
        doneCategory.setActions([yesAction, notQuiteAction, nopeLazyAction], forContext: UIUserNotificationActionContext.Default)
        
        let categories = NSSet(objects: reminderCategory, detectedCategory, doneCategory)
        
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Alert, categories: categories as? Set<UIUserNotificationCategory>))
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Badge, categories: categories as? Set<UIUserNotificationCategory>))
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Sound, categories: categories as? Set<UIUserNotificationCategory>))
        
    }


}

