//
//  MoveViewVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/19.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class MoveViewVc: UIViewController {
    
    var moveView: UIView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.moveView.frame = CGRectMake(100, 100, 100, 100)
        self.moveView.backgroundColor = UIColor.blueColor()
        view.addSubview(self.moveView)
        
        self.edgesForExtendedLayout = UIRectEdge.None
        
        self.moveView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches {
            
           let point = touch.locationInView(view)
            moveView.center = point
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // touch没有AnyObject这个属性
        for touch in touches {
            
            let point = touch.locationInView(view)
//            let size = self.moveView.bounds.size
            let offerX = point.x
            
            let offerY = point.y
//
//            if self.view.bounds.size.width - point.x < size.width {
//                
//                offerX = self.view.bounds.size.width - size.width
//                
//            }
//            
//            if self.view.bounds.size.height - point.y < size.height {
//                
//                offerY = self.view.bounds.size.height - size.height
//            }
//            
            moveView.center = CGPointMake(offerX, offerY)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches {
            
            let point = touch.locationInView(view)
            _ = self.moveView.bounds.size
//            var offerX = size.width - point.x
//            if offerX > 0 {
//                
//                offerX = size.width
//            }
//            
//            var offerY = size.height - point.y
//            
//            if offerY > 0 {
//                
//                offerY = size.height
//            }
//            
//            if self.view.bounds.size.width - point.x < size.width {
//                
//                offerX = self.view.bounds.size.width - size.width
//                
//            }
//            
//            if self.view.bounds.size.height - point.y < size.height {
//                
//                offerY = self.view.bounds.size.height - size.height
//            }
            
            moveView.center = point
        }
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        
         print(touches!.count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
