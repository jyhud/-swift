//
//  NetWorkRequest.swift
//  福利社swift
//
//  Created by admin on 15/9/14.
//  Copyright (c) 2015年 admin. All rights reserved.
//

import UIKit
import Alamofire

typealias resultCallBack = (AnyObject?,ErrorType?) -> (Void)

class NetWorkRequest: NSObject {
  
    static var singleton : NetWorkRequest?
    static var once  = dispatch_once_t()
    var  request:Request?
    
    
    class func shareInstance() -> NetWorkRequest? {
    
        if singleton == nil{
            dispatch_once(&once, { () -> Void in
                self.singleton = NetWorkRequest()
            })
        }
        return singleton
        
    }
    
    func getDataWithURlandParams(url:String,params:[String:AnyObject]?,callBack:resultCallBack) -> Void{
        
       let headers =  ["apikey":"f8a7f9b7bfac0de683a3c0cbf1a3d770"]
        
        Alamofire.request(.GET, url,parameters:params, headers: headers)
            .responseJSON { _, _, result in
                debugPrint(result)

                callBack(result.value,result.error)
        }
        
    }
    
    
    func cancelTask(){
    
        request?.cancel()
    }
    
    
}
