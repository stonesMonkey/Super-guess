//
//  ZZBaseBtn.swift
//  WangYi2
//
//  Created by WZZ on 16/7/21.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZBaseBtn: UIButton {

    // 原来要这样搞！！
    override var highlighted: Bool {
        
        didSet {
            
            super.highlighted = false
        }
    }
}
