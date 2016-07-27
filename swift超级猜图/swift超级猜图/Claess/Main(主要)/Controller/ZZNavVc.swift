//
//  ZZNavVc.swift
//  WangYi2
//
//  Created by WZZ on 16/7/21.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZNavVc: ZZBaseNavigationVc {
    
    override class func initialize() { // 该类第一次用的时候加载
        
        //
        if self.classForCoder() == ZZNavVc.classForCoder() {
            
            // 拿到全局的nav的bar
            let navBar = UINavigationBar.appearance()
            // 设置返回箭头的颜色
            navBar.tintColor = UIColor.whiteColor()
            // 设置
            navBar.setBackgroundImage(UIImage(named: "NavBar64"), forBarMetrics: UIBarMetrics.Default)
            //
              let font:UIFont = zzFont! as UIFont
            let attributes = [NSFontAttributeName:font,NSForegroundColorAttributeName: UIColor.whiteColor()]
            navBar.titleTextAttributes = attributes
            // 设置标题
            let item = UIBarButtonItem.appearance()
            
            // 获取字体
            item.setTitleTextAttributes(attributes, forState: UIControlState.Normal)
            //            item.setTitleTextAttributes(<#T##attributes: [String : AnyObject]?##[String : AnyObject]?#>, forState: <#T##UIControlState#>)
        }
    }
    
    // 这个方法swift禁止掉了
    //    internal override class func load() {
    
    
    //    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = UIRectEdge.None
        self.extendedLayoutIncludesOpaqueBars = false
    }
}
