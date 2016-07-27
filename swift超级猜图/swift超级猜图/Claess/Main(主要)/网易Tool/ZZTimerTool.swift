//
//  ZZTimerTool.swift
//  WangYi2
//
//  Created by WZZ on 16/7/22.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZTimerTool: NSObject {
    
    var Atarget: AnyObject?
    var selector: Selector?
    weak var timer: NSTimer?
    
    class func tool(timeInterval ti: NSTimeInterval, target aTarget: AnyObject, selector aSelector: Selector, userInfo: AnyObject?, repeats yesOrNo: Bool) -> ZZTimerTool {
        
        let timerTool = ZZTimerTool()
        timerTool.Atarget = aTarget
        timerTool.selector = aSelector
        let timer = NSTimer(timeInterval: ti, target: timerTool, selector: "timerSEL", userInfo: userInfo, repeats: yesOrNo)
        
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        timerTool.timer = timer
        
        return timerTool
    }
    
    func timerSEL() {
        
        self.Atarget?.performSelector(self.selector!)
    }
    
    // 销毁计时器
    func dismissTimer() {
        
        self.timer?.invalidate()
    }
}
