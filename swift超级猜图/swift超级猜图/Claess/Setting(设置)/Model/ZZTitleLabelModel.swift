//
//  ZZTitleLabel.swift
//  WangYi2
//
//  Created by WZZ on 16/7/25.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZTitleLabelModel: ZZBaseCellModel {
    
    var accessLabel: String?
    
    // 创建一个这个类型的 block
    typealias titleBlock = ()->()
    // 必须自己初始化一个block
    var block: titleBlock?
    
    init(title: String?, accessLabel: String?,block: titleBlock) {
        super.init()
        self.title = title
        self.accessLabel = accessLabel
        self.block = block
    }
//
    
//    class  func labelModel(title: String?, accessLabel: String?) -> ZZTitleLabelModel {
//        
////        let model = ZZTitleLabelModel.init()
//        
//        return model
//        
//    }
    
    
}
