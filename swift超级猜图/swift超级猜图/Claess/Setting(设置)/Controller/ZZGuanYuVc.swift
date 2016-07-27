//
//  ZZGuanYuVc.swift
//  WangYi2
//
//  Created by WZZ on 16/7/26.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZGuanYuVc: ZZSettingBaseVc {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pingFen = ZZArrowModel(iconName: nil, title: "评分支持", className: nil)
        
        let kefuDianHua = ZZArrowModel(iconName: nil, title: "客服电话", className: nil)
        
        let group = ZZGroupItemModel(cells: [pingFen,kefuDianHua], headerTitle: nil, footerTitle: nil)
        
        groups?.append(group)
        
        let headerView = NSBundle.mainBundle().loadNibNamed("ZZGuanYuHeaderView", owner: nil, options: nil).last as! ZZBaseView
        headerView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 216)
        
        tableView.tableHeaderView = headerView
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
