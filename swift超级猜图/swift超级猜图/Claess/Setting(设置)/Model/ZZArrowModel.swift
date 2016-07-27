//
//  ZZSettingCellModel.swift
//  WangYi2
//
//  Created by WZZ on 16/7/23.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZArrowModel: ZZBaseCellModel {
    
    typealias Arrowblock = ()->()

    var className: AnyClass?
    
    var arrowBlock: Arrowblock?
    
    init(iconName: String?, title: String?, className: AnyClass?) {
        super.init(iconName: iconName, title: title)
        self.className = className
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
