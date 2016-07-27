//
//  ZZSwitchCell.swift
//  WangYi2
//
//  Created by WZZ on 16/7/23.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZSwitchCell: ZZBaseCell {
    
    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var greenSwitch: UISwitch!
    
    @IBOutlet weak var lineView: UIView!
    
    @IBOutlet weak var leftLabelConstraint: NSLayoutConstraint!
    
    
    var switchModel: ZZSwitchModel? {
        
        didSet {
            
            if switchModel?.iconName != nil {
                
                self.iconView.image = UIImage(named: switchModel!.iconName!)
            } else {
                
                changeLabelConstraint()
            }

            self.titleLabel.text = switchModel!.title
            if switchModel?.isOn != nil {
             
                self.greenSwitch.on = switchModel!.isOn!
            }
            
        }
    }
    
    class func switchCell(tableView: UITableView, reuseIdentifier: String?) -> ZZSwitchCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier!)
        if cell == nil {
            
            cell = NSBundle.mainBundle().loadNibNamed("ZZSwitchCell", owner: nil, options: nil).last as! ZZSwitchCell
            cell!.alpha = 0.5
        }
        
        return cell as! ZZSwitchCell
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
