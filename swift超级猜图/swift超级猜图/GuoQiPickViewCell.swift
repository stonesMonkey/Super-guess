//
//  GuoQiPickView.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/16.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class GuoQiPickViewCell: UIView {
    
    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var titleView: UILabel!
    
    var guoQiModel: GuoQiModel? {
        
        didSet {
            
            iconView.image = UIImage(named: guoQiModel!.icon!)
            titleView.text = guoQiModel!.name
        }
    }
    
    class func pickCell() -> GuoQiPickViewCell {
        
        let cell = NSBundle.mainBundle().loadNibNamed("GuoQiPickViewCell", owner: nil, options: nil).last as! GuoQiPickViewCell
        
        return cell
    }
    
}
