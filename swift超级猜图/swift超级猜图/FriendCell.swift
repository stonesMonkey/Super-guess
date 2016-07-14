//
//  FriendCell.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/14.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    
    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
   
    @IBOutlet weak var introLabel: UILabel!
    
    var model: FriendModel? {
        
        didSet {
            
            iconView.image = UIImage(named: model!.icon!)
            nameLabel.text = model!.name
            introLabel.text = model!.intro
            
        }
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
    }
    
    // action
    
    
    
    
}
