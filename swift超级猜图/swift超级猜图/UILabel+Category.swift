//
//  UILabel+Category.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/8.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

extension UILabel {
   
    
    convenience init(title: String, fontSize: CGFloat, alighment: NSTextAlignment,color: UIColor) {
        
        self.init()
        text = title
        font = UIFont.systemFontOfSize(14)
        textAlignment = NSTextAlignment.Center
        textColor = UIColor.whiteColor()
    }
    
   
}
