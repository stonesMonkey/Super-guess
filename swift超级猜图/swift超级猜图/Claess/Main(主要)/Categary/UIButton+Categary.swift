//
//  UIButton+Categary.swift
//  WangYi2
//
//  Created by WZZ on 16/7/21.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

extension UIButton {
    
    convenience init(frame: CGRect, nomalImage: String, heightImage: String?) {
        
        self.init(type: UIButtonType.Custom)
        
        self.frame = frame
        self.setBackgroundImage(UIImage(named: nomalImage), forState: UIControlState.Normal)
        if heightImage != nil {
         
            self.setBackgroundImage(UIImage(named: heightImage!), forState: UIControlState.Highlighted)
        }
        
    }
}