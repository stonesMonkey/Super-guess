//
//  ZZBaseModel.swift
//  WangYi2
//
//  Created by WZZ on 16/7/23.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZBaseCellModel: NSObject {
    
    var iconName: String?
    var title: String?
    
    override init() {
        super.init()
    }
    
    init(iconName: String?, title: String?) {
        super.init()

        self.iconName = iconName
        self.title = title
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
