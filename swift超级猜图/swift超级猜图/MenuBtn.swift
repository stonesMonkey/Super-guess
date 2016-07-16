//
//  MenuBtn.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/15.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class MenuBtn: UIButton {
    
    var menuVc: UIMenuController = UIMenuController.sharedMenuController();
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.userInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: "tapSelector")
        
        self.addGestureRecognizer(tap)
    }
    
    func tapSelector() {
        
        self.becomeFirstResponder()
        
        let menuItem1: UIMenuItem = UIMenuItem(title: "复制", action: "endFrist")
        let menuItem2: UIMenuItem = UIMenuItem(title: "撤销", action: "endFrist")
        let menuItem3: UIMenuItem = UIMenuItem(title: "转发", action: "endFrist")
        let menuItem4: UIMenuItem = UIMenuItem(title: "收藏", action: "endFrist")
        let menuItem5: UIMenuItem = UIMenuItem(title: "删除", action: "endFrist")
        
        menuVc.menuVisible = true
        menuVc.menuItems = [menuItem1,menuItem2,menuItem3,menuItem4,menuItem5]
        
        // 必须
        menuVc.setTargetRect(self.bounds, inView: self)
        
        menuVc.setMenuVisible(true, animated: true)
    }
    
    func endFrist() {
        
        
    }
    
    // 必须
    override func canBecomeFirstResponder() -> Bool {
        
        return true
    }
    
    // 必须
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        
        if (action == Selector.init("copy:") || action == Selector.init("endFrist")) {
            
            return true
        }
        return false
    }
}
