//
//  ZZHtmlVc.swift
//  WangYi2
//
//  Created by WZZ on 16/7/26.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZHtmlVc: ZZBaseVc {
    
    weak var webView: UIWebView?
    
    var model: ZZHelpModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView()
        
        self.title = model!.title
        self.view.backgroundColor = UIColor.whiteColor()
        //  关闭按钮
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: UIBarButtonItemStyle.Done, target: self, action: "guanBiItemClick")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func guanBiItemClick() {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func setupWebView() {
        
        let webView = UIWebView()
        webView.frame = view.bounds
        view.addSubview(webView)
        webView.delegate = self
        let filePath = NSBundle.mainBundle().pathForResource(model?.html, ofType: nil)
        let url = NSURL(fileURLWithPath: filePath!)
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
        self.webView = webView
    }
    
}

extension ZZHtmlVc: UIWebViewDelegate {
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        if self.model!.id != nil {
            let jsStr = String(format: "window.location.href = '#%@'", self.model!.id!)
            webView.stringByEvaluatingJavaScriptFromString(jsStr)
        }
    }
}
