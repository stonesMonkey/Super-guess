//
//  ZZLoginVc.swift
//  WangYi2
//
//  Created by WZZ on 16/7/22.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZLoginVc: ZZBaseVc {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Done, target: self, action: "back")
    }
    
    func back() {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
