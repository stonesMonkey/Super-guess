//
//  TuanGouCell.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/12.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class TuanGouCell: UITableViewCell {

    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var personNumber: UILabel!
    
    private var tgModel:TGModel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setTgModel(model: TGModel) {
        
        tgModel = model
        iconView.image = UIImage(named: model.icon!)
        titleLabel.text = model.title
        priceLabel.text = String(format: "$ " + model.price!)
        personNumber.text = String(format: model.buyCount! + "已购买")
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func tgCell() -> TuanGouCell {
        
        let cell = NSBundle.mainBundle().loadNibNamed("TuanGouCell", owner: nil, options: nil).last as! TuanGouCell
        
        return cell
    }
    
}
