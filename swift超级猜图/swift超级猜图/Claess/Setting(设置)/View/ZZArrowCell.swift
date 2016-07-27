//
//  ZZArrowCell.swift
//  WangYi2
//
//  Created by WZZ on 16/7/23.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZArrowCell: ZZBaseCell {
    
    
    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var lineView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var leftLabelConstraint: NSLayoutConstraint!
    
    
    
    
    var arrowModel: ZZArrowModel? {
        
        didSet {
            
            
            if arrowModel!.iconName != nil {
            
                self.iconView.image = UIImage(named: arrowModel!.iconName!)
            
            } else {
//
               changeLabelConstraint()
            }
            
            self.titleLabel.text = arrowModel?.title
            
        }
    }
    class func arrowCell(tableView: UITableView, reuseIdentifier: String?) -> ZZArrowCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier!)
        if cell == nil {
            
            cell = NSBundle.mainBundle().loadNibNamed("ZZArrowCell", owner: nil, options: nil).last as! ZZArrowCell
            cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
        }
        
        return cell as! ZZArrowCell
    }
    
    func changeLabelConstraint() {
        
        // 坑爹的玩意。在添加约束的时候或者删除的时候约束都是加到contentView的cell上而不是加到cell本身上。当然删除也是删除contenView上才对@!!j
//         删除一条约束
        self.contentView.removeConstraint(leftLabelConstraint)
        // 创建一条Label的约束左边
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.imageView?.translatesAutoresizingMaskIntoConstraints = false
        self.lineView.translatesAutoresizingMaskIntoConstraints = false
        let newConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 10)
        
        self.contentView.addConstraint(newConstraint)
        // 更新
        self.contentView.layoutIfNeeded()
    }
    
}
