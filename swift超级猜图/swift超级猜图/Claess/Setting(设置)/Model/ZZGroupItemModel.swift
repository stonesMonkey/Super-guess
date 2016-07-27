//
//  ZZGroupItemModel.swift
//  WangYi2
//
//  Created by WZZ on 16/7/23.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZGroupItemModel: NSObject {
    
    var cells: [AnyObject]?
    var sectionHeadTitle: String?
    var footerTitle: String?
    
    init(cells: [AnyObject]? ,headerTitle: String? , footerTitle: String?) {
        super.init()
        self.cells = cells
        self.sectionHeadTitle = headerTitle
        self.footerTitle = footerTitle
    }
}
