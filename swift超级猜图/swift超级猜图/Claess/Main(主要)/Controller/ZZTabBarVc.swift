//
//  ZZTabBarVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/19.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZTabBarVc: ZZBaseTabBarVc {
    
    lazy var zzBar: ZZTabBar = {
        
        let bar = ZZTabBar(frame: CGRectMake(0, 0,screenW,49))
        
        
        return bar
    }()
    // 有五个元素
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zzBar.backgroundColor = UIColor.blackColor()
        zzBar.delegate = self
        tabBar.addSubview(zzBar)
    }
}

extension ZZTabBarVc: ZZTabBarDelegate {
    
    func ZZTabBarBtnDidCllick(tabBar: ZZTabBar, btn: ZZBaseBtn) {
        
        let selectNum = btn.tag - 1001
        self.selectedIndex = selectNum
    }
}
