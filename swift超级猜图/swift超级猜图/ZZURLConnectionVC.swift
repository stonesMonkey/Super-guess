//
//  ZZURLConnection.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/27.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZURLConnectionVC: ZZBaseVc {

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL(string: "https://m.baidu.com")
        
        let request = NSMutableURLRequest(URL: url!)
        request.setValue("iPhoneAppWebKit", forHTTPHeaderField: "User-Agent")
        let queue = NSOperationQueue.mainQueue()
        let webView = UIWebView()
        webView.frame = self.view.bounds
        view.addSubview(webView)
        var dataX: NSData?
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler: { (respines: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
            
            if data == nil || error != nil {
                
                print("你的网络不给力")
            }
            
            print(respines)
            print(data)
            
            dataX = data!
            print(error)
            
            let str: NSString = NSString(data: data!, encoding: NSUTF8StringEncoding)!
            
            webView.loadHTMLString(str as String, baseURL: url)
            
        })
        
        
        
//        webView.loadData(dataX, MIMEType: nil, textEncodingName: NSUTF8StringEncoding, baseURL: nil)
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
