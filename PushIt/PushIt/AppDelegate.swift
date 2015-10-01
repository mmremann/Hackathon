//
//  AppDelegate.swift
//  PushIt
//
//  Created by Mann, Josh (US - Denver) on 9/25/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        setupNotifications(application)
        
        Parse.setApplicationId("tzZAVsPVVhGs06CKL3MNtdHkTTAYdwv9Yy6AINjI",
            clientKey: "sOlRMDMw0fz64j5smYd4kUcyA49EGJdh4FHW2J1C")
        
        // Register for Push Notitications
        if application.applicationState != UIApplicationState.Background {
            // Track an app open here if we launch with a push, unless
            // "content_available" was used to trigger a background push (introduced in iOS 7).
            // In that case, we skip tracking here to avoid double counting the app-open.
            
            let preBackgroundPush = !application.respondsToSelector("backgroundRefreshStatus")
            let oldPushHandlerOnly = !self.respondsToSelector("application:didReceiveRemoteNotification:fetchCompletionHandler:")
            var pushPayload = false
            if let options = launchOptions {
                pushPayload = options[UIApplicationLaunchOptionsRemoteNotificationKey] != nil
            }
            if (preBackgroundPush || oldPushHandlerOnly || pushPayload) {
                PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
            }
        }
        if application.respondsToSelector("registerUserNotificationSettings:") {
            let userNotificationTypes = UIUserNotificationType.Alert | UIUserNotificationType.Badge | UIUserNotificationType.Sound
            let settings = UIUserNotificationSettings(forTypes: userNotificationTypes, categories: nil)
            application.registerUserNotificationSettings(settings)
            application.registerForRemoteNotifications()
        } else {
            let types = UIRemoteNotificationType.Badge | UIRemoteNotificationType.Alert | UIRemoteNotificationType.Sound
            application.registerForRemoteNotificationTypes(types)
        }
        
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
    
    //MARK: - Parse Methods
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        let installation = PFInstallation.currentInstallation()
        installation.setDeviceTokenFromData(deviceToken)
        installation.saveInBackground()
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        if error.code == 3010 {
            println("Push notifications are not supported in the iOS Simulator.")
        } else {
            println("application:didFailToRegisterForRemoteNotificationsWithError: %@", error)
        }
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        PFPush.handlePush(userInfo)
        if application.applicationState == UIApplicationState.Inactive {
            PFAnalytics.trackAppOpenedWithRemoteNotificationPayload(userInfo)
        }
    }

}

