//
//  InterfaceController.swift
//  WatchKit Extension
//
//  Created by Lee on 9/23/15.
//  Copyright © 2015 admin. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {
    var hasImg: Bool?

    @IBOutlet weak var wkImgView: WKInterfaceImage!
    @IBOutlet weak var wkButton: WKInterfaceButton!

    @IBAction func sendNotification()
    {
        if WCSession.defaultSession().reachable
        {
            let sendMessage = ["msg":"我是个iWatch传递过来的信息，点我点我点我点我点我点我点我点我点我点我点我点我点我"]
            WCSession.defaultSession().sendMessage(sendMessage, replyHandler:{
                (result:[String:AnyObject]) -> Void in
                print("\(result)")
                }, errorHandler: {
                    (error:NSError) -> Void in
            })
        }
    }
    
    @IBAction func loadImage(state: WKInterfaceSwitch)
    {
        if (hasImg == true) {
            print("Clear vogue image.")
            wkImgView.setImage(nil)
            hasImg = false
        }else{
            print("Set vogue image.")
            wkImgView.setImage(UIImage(named: "icon80"))
            hasImg = true
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
        
        //激活WCSession
        if WCSession.isSupported()
        {
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
