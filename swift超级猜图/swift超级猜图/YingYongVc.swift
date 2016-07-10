//
//  ViewController.swift
//  One
//
//  Created by WZZ on 16/7/3.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class YingYongVc: UIViewController {

    let appModels: [AppModel] = AppModel().models()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
       setupSubView()
    }
    
    func setupSubView() {
    

        
        let width:CGFloat = 60.0
        let height:CGFloat = 90.0
        let appendW:CGFloat = (UIScreen.mainScreen().bounds.width - (3.0 * width)) / 4
        let appendH:CGFloat = appendW
        for i in 0..<appModels.count {
            
            let x = appendW + (CGFloat)(i % 3) * (appendW + width)
            let y = 70.0 + (CGFloat)(i / 3) * (appendH + height)
            
            let frame: CGRect = CGRectMake(x, y, width, height);
            let appView: AppView = AppView(frame: frame)
            
            appView.appModel = appModels[i]
            
            view.addSubview(appView)
        }
    }
    


}

