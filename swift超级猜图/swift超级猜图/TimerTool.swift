//
//  TimerTool.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/11.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class TimerTool: NSObject {
    
    
    var sel:Selector?
    weak var selectorTarget: AnyObject?
    weak var timer: NSTimer?
    
    func runSelector(timeInterval ti: NSTimeInterval, target aTarget: AnyObject, selector aSelector: Selector, userInfo: AnyObject?, repeats yesOrNo: Bool) -> TimerTool {
        
        let timer = NSTimer(timeInterval: ti, target: self, selector: "repeatFunc", userInfo: userInfo, repeats: yesOrNo)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        sel = aSelector
        self.selectorTarget = aTarget
        self.timer = timer
        return self
    }
    
    func removeTimer() {
        
        self.timer?.invalidate()
        self.timer = nil
    }
    
    deinit {
        
        print("消失了")
    }
    
    func repeatFunc() {
        
        self.selectorTarget?.performSelector(self.sel!)
    }
}
