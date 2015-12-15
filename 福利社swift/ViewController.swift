//
//  ViewController.swift
//  福利社swift
//
//  Created by admin on 15/9/14.
//  Copyright (c) 2015年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
  
    var dataArray:NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableView.separatorStyle = .None

        self.title = "水果福利"
//        self.myTableView.estimatedRowHeight = 88
//        self.myTableView.rowHeight = UITableViewAutomaticDimension
        self.myTableView.registerNib(UINib(nibName:"ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
        self.getNetWorkData()
    }
    
    
    //MARK:
    
    
    func getNetWorkData() -> () {
    
        
        var params:[String:AnyObject] = [:]
        params["num"] = "10"
        params["rand"] = "1"
        params["word"] = "水果"
        params["page"] = "3"
        let urlSt = Common().createUrl(Common.baseURl,paramUrl: Common.photoUrl)
        weak var weakSelf = self
        
        NetWorkRequest.shareInstance()?.getDataWithURlandParams(urlSt, params: params, callBack: { (result, error) -> (Void) in
            

            let dic = result as? NSDictionary
            
            
            for  item in dic!{
                
                print("item is \(item.value)")
                weakSelf!.dataArray.addObject(item.value)
            }

            weakSelf?.myTableView.reloadData()
            
        })
        
        
    }
    
    //MARK:
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
        return self.dataArray.count
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
        let cell :ListTableViewCell = tableView.dequeueReusableCellWithIdentifier("ListTableViewCell", forIndexPath: indexPath) as! ListTableViewCell
        
        let dic = self.dataArray.objectAtIndex(indexPath.row)
        
        let str = dic["picUrl"] as? String
        
        if str != nil{
            
            cell.imag.sd_setImageWithURL(NSURL(string: str!), placeholderImage: nil, completed: { (UIImage, NSError, SDImageCacheType, NSURL) -> Void in
            
            })
            
        }
        
        let titleStr = dic["title"] as? String
        
        if titleStr != nil{
            
            cell.lab.text = titleStr
            
        }
       
       
        return cell
        
    
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        
        return 300
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
    
        let VC :WebViewController = self.storyboard?.instantiateViewControllerWithIdentifier("WebViewController") as! WebViewController
        
        if self.dataArray.count > 0{
       
            let dic = self.dataArray.objectAtIndex(indexPath.row)
            
            let str = dic["url"] as? String
           
            VC.articleStr = str
            
        }
        
        self.navigationController?.pushViewController(VC, animated: true)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

