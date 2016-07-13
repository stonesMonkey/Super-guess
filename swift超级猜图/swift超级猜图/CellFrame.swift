//
//  CellFrame.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/12.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class CellFrame: NSObject {
    
    var textFrame: CGRect?
    var iconFrame: CGRect?
    var nameFrame: CGRect?
    var vipFrame: CGRect?
    var pictureFrame: CGRect?
    var model: WeiBoModel?
    var cellHeight: CGFloat?
    init(model: WeiBoModel) {
        
        super.init()
        self.model = model
        iconFrame = CGRectMake(10, 10, 50, 50)
        let nameStr: NSString = model.name! as NSString
        
        // 设置nameFrame
        let nameSize = nameStr.strBoundingRectWithSize(NSStringDrawingOptions.UsesFontLeading, context: nil)
        nameFrame = CGRectMake(70, 30, nameSize.width, nameSize.height)
        vipFrame = CGRectMake(nameFrame!.size.width + nameFrame!.origin.x + 10.0, nameFrame!.origin.y, 30, 30)
        
//        if model.text != nil {
        let textStr: NSString = model.text! as NSString
            let textSize = textStr.strBoundingRectWithSize(Utils.combine(), context: nil)
            
            textFrame = CGRectMake(10.0, iconFrame!.origin.y + 60 + 5, textSize.width, textSize.height)
            
            if model.picture != nil {
                
                pictureFrame = CGRectMake(self.textFrame!.origin.x, self.textFrame!.origin.y + textFrame!.size.height + 5, 100, 100)
                
                cellHeight = pictureFrame!.origin.y + 100.0 + 5
                
            } else {
                
                cellHeight = self.textFrame!.origin.y + textFrame!.size.height + 5.0
        }
        
        
//        }
//        else {
//            
//            textFrame = CGRectZero
//            
//            if model.picture != nil {
//                
//                pictureFrame = CGRectMake(self.nameFrame!.origin.x + 5.0, nameFrame!.origin.y + 5, 100, 100)
//                
//                cellHeight = pictureFrame!.origin.y + 100.0 + 5
//            } else {
//                
//                // 如果没图片又没文字直接不让cell出来
//                cellHeight = 0
//            }
//        
//    }
}

class func weiBoCellFrame(model: [WeiBoModel]) -> [CellFrame] {
    
    var cellFrames:[CellFrame] = [CellFrame]()
    
    for i in 0..<model.count {
        
        let cellFrame = CellFrame(model: model[i])
        cellFrames.append(cellFrame)
    }
    return cellFrames
}
}
