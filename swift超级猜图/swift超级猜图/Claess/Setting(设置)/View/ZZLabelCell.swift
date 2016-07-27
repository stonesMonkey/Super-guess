//
//  ZZLabelCell.swift
//  WangYi2
//
//  Created by WZZ on 16/7/25.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZLabelCell: ZZBaseCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var accessLabel: UILabel!
    
    @IBOutlet weak var lineView: UIView!
    
    
    var titleLabelModel: ZZTitleLabelModel? {
        
        didSet {
            
            titleLabel.text = titleLabelModel?.title
            accessLabel.text = titleLabelModel?.accessLabel
            
        }
    }
    
    class func labelCell(tableView: UITableView, reuseIdentifier: String?) -> ZZLabelCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier!)
        if cell == nil {
            
            cell = NSBundle.mainBundle().loadNibNamed("ZZLabelCell", owner: nil, options: nil).last as! ZZLabelCell
        }
        
        return cell as! ZZLabelCell
    }
}
