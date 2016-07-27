//
//  YellowView.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/19.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class YellowView: UIView {

    
    weak var btn: UIButton?
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        print("yellowView相应")
    }
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        
        // 这个点在不在btn上
        // 穿过来的point是已黄色的View为单位。但是btn的frame值是已父控件的view为单位所以
        // 把点转换为已btn为原点的按钮
        let pointBtn = self.convertPoint(point, toView: self.btn)
        // 判断点在不在按钮上
         let bool = self.btn?.pointInside(pointBtn, withEvent: event)
        
        if bool == true { //
            // 如果在那么
            return self.btn
        } else { // 否则把这个事件给父控制器的View去处理
            
            return super.hitTest(point, withEvent: event)
        }
       
        
    }
    
    // 最佳响应者
//    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
//        
//        return btn
//    }

}
