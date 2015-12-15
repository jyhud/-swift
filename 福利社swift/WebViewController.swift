//
//  WebViewController.swift
//  福利社swift
//
//  Created by admin on 15/9/22.
//  Copyright © 2015年 admin. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    var articleStr : String?
    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "文章简介"
        
        if articleStr != nil{
            
            print("articleStr is \(articleStr!)")
            let url = NSURL(string: articleStr!)
            let request: NSURLRequest = NSURLRequest(URL: url!)
            self.webView.loadRequest(request)
        }
        
 
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
