//
//  ZZTabBar.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/19.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

// 定义一个枚举
enum Shape: Int {
    
    case gouCaiDaTing = 1001
    case heiMaGenDan = 1002
    case xingYunXuanHao = 1003
    case kaiJiangXinXi = 1004
    case wodeCaiPiao = 1005
}

protocol ZZTabBarDelegate: NSObjectProtocol {
    
    func ZZTabBarBtnDidCllick(tabBar: ZZTabBar, btn: ZZBaseBtn)
}

class ZZTabBar: ZZBaseView {

    
    weak var delegate: ZZTabBarDelegate?
    
     override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setUpSubView()
    }
    
    // 上一次按钮
    var preBtn: ZZBaseBtn?

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    func setUpSubView() {
        
        let btnW: CGFloat = 64
        let btnH: CGFloat = 49
        let screenW = UIScreen.mainScreen().bounds.size.width
        let btnY: CGFloat = 0
        let appding = (screenW - btnW * 5) / 6
        for i in 0..<5 { // 创建5个btn
            
            let btnX = appding + (appding + btnW) * CGFloat(i)
            let btn = ZZBaseBtn(type: UIButtonType.Custom)
            let imageName = String(format: "TabBar%ld",i + 1)
            let imageHightName = String(format: "TabBar%ldSel", i + 1)
            btn.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
            btn.setImage(UIImage(named: imageHightName), forState: UIControlState.Selected)
            btn.frame = CGRectMake(btnX, btnY, btnW, btnH)
            btn.addTarget(self, action: "btnDidClick:", forControlEvents: UIControlEvents.TouchDown)
            btn.tag = i + 1001
            // 一进来选中状态
            if i == 4 {
                
                let preBtn = self.subviews[0] as! ZZBaseBtn
                self.preBtn = preBtn
                self.btnDidClick(preBtn)
            }
            self.addSubview(btn)
        }
    }
    
    func btnDidClick(sender: ZZBaseBtn) {
        self.preBtn?.selected = false
        sender.selected = !sender.selected
        self.preBtn = sender
        if delegate != nil {
            
            delegate?.ZZTabBarBtnDidCllick(self, btn: sender)
        }
        
    }
    

}
