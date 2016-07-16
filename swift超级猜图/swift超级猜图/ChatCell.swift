//
//  ChatCell.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/14.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var textBtn: UIButton!
    
    var chatCellFrame: ChatCellFrame? {
        
        didSet {
            
            // 当时使用xib的时候，又用frame值记得把sizeclass去掉
            timerLabel.frame = chatCellFrame!.timerLabelFrame!
            iconView.frame = chatCellFrame!.iconViewFrame!
            textBtn.frame = chatCellFrame!.textBtnFrame!
            
            let model: MessageModel = chatCellFrame!.messageModel!
            
            if model.type == 0 { // 自己
                
                iconView.image = UIImage(named: "me")
                textBtn.setBackgroundImage(UIImage(named: "chat_send_nor"), forState: UIControlState.Normal)
                textBtn.setBackgroundImage(UIImage(named: "chat_send_press_pic"), forState: UIControlState.Highlighted)
            } else if model.type == 1 { // 别人
                
                iconView.image = UIImage(named: "other")
                textBtn.setBackgroundImage(UIImage(named: "chat_recive_nor"), forState: UIControlState.Normal)
                textBtn.setBackgroundImage(UIImage(named: "chat_recive_press_pic"), forState: UIControlState.Highlighted)
            }
            
            textBtn.setTitle(model.text, forState: UIControlState.Normal)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        timerLabel.backgroundColor = UIColor.orangeColor()
        timerLabel.font = UIFont.systemFontOfSize(12)
        timerLabel.textAlignment = NSTextAlignment.Center
        timerLabel.textColor = UIColor.grayColor()
        
        textBtn.titleLabel?.font = UIFont.systemFontOfSize(12)
        textBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        textBtn.backgroundColor = UIColor.orangeColor()
//        textBtn.contentEdgeInsets = UIEdgeInsetsMake(20, 0, 20, 0)
        textBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 20)
        textBtn.titleLabel?.numberOfLines = 0
        textBtn.translatesAutoresizingMaskIntoConstraints = false
        textBtn.addTarget(self, action: "textBtnDidClick", forControlEvents: UIControlEvents.TouchDown)
    }

    func textBtnDidClick() {
        
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
