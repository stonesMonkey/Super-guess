//
//  UIButton+Category.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/8.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

extension UIButton {
    
    /**
     快速创建按钮
     
     - parameter title:       按钮标题
     - parameter normalImage: 普通环境下的图片
     - parameter hightImage:  高亮状态下图片
     - parameter fontSize:    字体大小
     
     - returns: 返回值类型
     */
    convenience init(title:String, normalImage:String, hightImage:String, fontSize: CGFloat = 12) {
        
        self.init(frame:CGRectZero)
        setBackgroundImage(UIImage(named: normalImage), forState: UIControlState.Normal)
        setBackgroundImage(UIImage(named: hightImage), forState: UIControlState.Highlighted)
        setTitle(title, forState: UIControlState.Normal)
        titleLabel?.font = UIFont.boldSystemFontOfSize(fontSize)
        
        setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    }
    
    convenience init(title:String, image: String, state: UIControlState) {
        
        self.init(type: UIButtonType.Custom)
        setTitle(title, forState: UIControlState.Normal)
        setImage(UIImage(named: image), forState:state)
        titleLabel?.textColor = UIColor.whiteColor()
        titleLabel?.font = UIFont.systemFontOfSize(14)
        
    }
    
    convenience init(imageName: String, imageEdgeInsets: UIEdgeInsets) {
        
        self.init(type: UIButtonType.Custom)
        self.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        self.imageEdgeInsets = imageEdgeInsets
        self.backgroundColor = UIColor.whiteColor()
    }
}
