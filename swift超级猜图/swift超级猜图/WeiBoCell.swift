//
//  WeiBoCell.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/12.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class WeiBoCell: UITableViewCell {

    var iconView: UIImageView = UIImageView()
    var titleLabel: UILabel = UILabel()
    var vipView: UIImageView = UIImageView(image: UIImage(named: "vip"))
    var nameLabel: UILabel = UILabel()
    var bigImage: UIImageView = UIImageView()
    var model: WeiBoModel? {
        didSet {

            iconView.image = UIImage(named: model!.icon!)
            nameLabel.text = model?.text
            if model?.vip == 1 {
                
                vipView.hidden = true
            } else {
                
                vipView.hidden = false
            }
            nameLabel.text = model?.name
            
            if  model?.picture != nil {
                
                bigImage.image = UIImage(named: (model!.picture)!)
            } else {
                
                bigImage.image = nil
            }
            
            titleLabel.text = model?.text
            titleLabel.backgroundColor = UIColor.orangeColor()
            titleLabel.numberOfLines = 0
        }
    }
    
    class func cell(tableView: UITableView, reuseIdentifier: String?) -> WeiBoCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier!)
        if (cell == nil) {
            
            cell = WeiBoCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: reuseIdentifier)
        }
            return cell as! WeiBoCell
    }
    var cellFrame: CellFrame? {
        
        didSet {
            
           model = cellFrame?.model
            
            iconView.frame = cellFrame!.iconFrame!
            vipView.frame = cellFrame!.vipFrame!
            nameLabel.frame = cellFrame!.nameFrame!
            
            if  cellFrame?.pictureFrame != nil {
                
                bigImage.frame = cellFrame!.pictureFrame!
            }
            
            if cellFrame?.textFrame != nil {
                
                titleLabel.frame = cellFrame!.textFrame!
            }
            
            
            
        }
    }
    
    var cellHeight: CGFloat?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubView() {
        
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFontOfSize(10)
        nameLabel.font = UIFont.systemFontOfSize(10)
        contentView.addSubview(iconView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(vipView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(bigImage)
    }
    
    
    
  
    
}
