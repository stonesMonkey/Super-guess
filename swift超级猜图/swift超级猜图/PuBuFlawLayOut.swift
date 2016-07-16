//
//  PuBuFlawLayOut.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/15.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

protocol PuBuFlawLayOutDelegate: NSObjectProtocol {
    
    func PuBuFlawLayOutRowHeight(index: Int, width: CGFloat) -> CGFloat;
}

class PuBuFlawLayOut: UICollectionViewFlowLayout {

    // 代理
    weak var delegate:PuBuFlawLayOutDelegate?
    
    lazy var attributs: [UICollectionViewLayoutAttributes] = [UICollectionViewLayoutAttributes]()
    
//    var groups:[PuBuModel]?
//    
//    func setGroup(groups: [PuBuModel]?) {
//        
//        self.groups = groups
//    }
    
    var columnCount: Int?
    
    lazy var rowDict: [String: String]? = {
       
        return ["0":"0.0","1":"0.0","2":"0.0"]
    }()
    override func prepareLayout() {  // 当重新布局的时候调用
        super.prepareLayout()
        
        let count: Int = self.collectionView!.numberOfItemsInSection(0)
        for i in 0..<count {
            
            let indexPath = NSIndexPath(forRow: i, inSection: 0 )
            let attribute:UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
            // frame
//            let model: PuBuModel = self.groups![i]
            // size
            let width: CGFloat = (collectionView!.bounds.size.width - self.sectionInset.left - sectionInset.right - (CGFloat(self.columnCount!) - 1) * self.minimumInteritemSpacing) / CGFloat(self.columnCount!)
            var height: CGFloat = 130
            if  self.delegate != nil {
                
                height = self.delegate!.PuBuFlawLayOutRowHeight(i, width: width)
            }
            // x y // 找到Y值最低的那个
            let col = maxCol()
            
            let x: CGFloat = self.sectionInset.left + (width + self.minimumInteritemSpacing) * CGFloat((col as NSString).floatValue)
            let heightCol = (rowDict![col]! as NSString).floatValue
            let y: CGFloat = self.sectionInset.top + self.minimumLineSpacing + CGFloat(heightCol)
            rowDict![col as String] = String(format: "%lf",y + height + self.minimumLineSpacing)
            // fame值
            let frame = CGRectMake(x, y, width, height)
            attribute.frame = frame
            self.attributs.append(attribute)
        }
    }
    
    override func collectionViewContentSize() -> CGSize { // 确定滚动的范围
        
        let lastAttribute: UICollectionViewLayoutAttributes = self.attributs.last!
        let frame = lastAttribute.frame
        
        let size = CGSizeMake(UIScreen.mainScreen().bounds.size.width, CGRectGetMaxY(frame) + 10.0)
        return size
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? { // 返回每一个cell的布局
        
        return self.attributs
    }
    
    // 最小Y值的行数
    func maxCol() -> String {
        
        var col = "0"
        let count: Int = self.rowDict!.count
        for i in 0..<count {
            
            let colStr = String(format: "%ld", i)
            if (rowDict![col]! as NSString).floatValue > (rowDict![colStr]! as NSString).floatValue {
            
                col = colStr
            }
        }
        return col
    }
}

//class RowModel: NSObject {
//    
//    var oneRow: CGFloat = 0
//    var twoRow: CGFloat = 0
//    var threeRow: CGFloat = 0
//    
//    // 找到最大值 返回那个值的Key
//    func maxRow() -> String {
//        
//        if  oneRow >= twoRow && oneRow >= threeRow {
//            
//            return "oneRow"
//        } else if twoRow >= threeRow {
//            
//            return "twoRow"
//        } else {
//            
//            return "threeRow"
//        }
//        
//        
//        
//    }
//}
