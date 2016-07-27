//
//  LayerTransForm.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/19.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class LayerTransFormVc: UIViewController {
    
    lazy var redView:UIView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()

        redView.frame = CGRectMake(100, 100, 100, 100)
        redView.backgroundColor = UIColor.redColor()
        view.addSubview(redView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
//         self.redView.layer.transform = CATransform3DRotate(self.redView.layer.transform, CGFloat(M_PI_4), 1, 1, 1)
        
//        self.redView.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
        
        // 禁止隐式动画
        CATransaction.begin() // 开启事务
        CATransaction.setDisableActions(true)
        self.view.layer.bounds = CGRectMake(0, 0, 300, 300)
        CATransaction.commit() // 提交事务
    }
    

}
