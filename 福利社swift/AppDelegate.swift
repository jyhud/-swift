//
//  AppDelegate.swift
//  福利社swift
//
//  Created by admin on 15/9/14.
//  Copyright (c) 2015年 admin. All rights reserved.
//

import UIKit
import WatchConnectivity

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate, WCSessionDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        if WCSession.isSupported()
        {
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        
        //注册通知
        let notifications = UIUserNotificationSettings(forTypes: UIUserNotificationType(arrayLiteral: UIUserNotificationType.Alert, UIUserNotificationType.Badge, UIUserNotificationType.Sound), categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(notifications)
        
        return true
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void)
    {
        let msg = message["msg"] as! String
        
        let localNotification = UILocalNotification()
        localNotification.alertBody = "\(msg) - \(NSDate().description)"
        localNotification.alertTitle = "提示"
        localNotification.alertAction = "action"
        localNotification.fireDate = NSDate()
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
        let receive = ["msg":"收到消息了：\(NSDate().description)"]
        replyHandler(receive)
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
}

