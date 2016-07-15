//
//  ChatCellFrame.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/14.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ChatCellFrame: NSObject {
    
    
    var timerLabelFrame: CGRect?
    
    var iconViewFrame: CGRect?
    
    var textBtnFrame: CGRect?
    
    var messageModel: MessageModel?
    
    var timerhiden: Bool?
    
    var cellHeight: CGFloat?
    
    init(messageModel: MessageModel) {
        super.init()
        self.messageModel = messageModel
        let screenWidth:CGFloat = UIScreen.mainScreen().bounds.size.width
        let timerLabelHight:CGFloat = 25.0
        // 时间文本frame
        timerLabelFrame = CGRectMake(0, 0, screenWidth, timerLabelHight)
        
        // 设置文本
        let iconWidth:CGFloat = 30.0
        let appding:CGFloat = 10.0
        let textStr: NSString = messageModel.text! as NSString
        let textSize = textStr.strBoundingRectWithSize(Utils.combine(), context: nil)
        cellHeight = 0
        let offer:CGFloat = 20.0
        if (messageModel.type == 0) { // 自己
            
            iconViewFrame = CGRectMake(screenWidth - iconWidth - appding, timerLabelHight + appding, iconWidth, iconWidth)
            
            textBtnFrame = CGRectMake(screenWidth - textSize.width - offer * 2 - 2 * appding - iconWidth,  iconViewFrame!.origin.y + iconWidth * 0.5, textSize.width + offer * 2, textSize.height + offer)
            
           
        } else if (messageModel.type == 1) { // 朋友
            
            iconViewFrame = CGRectMake(appding, timerLabelHight + appding, iconWidth, iconWidth)
            textBtnFrame = CGRectMake(appding * 2 + iconWidth,  iconViewFrame!.origin.y + iconWidth * 0.5, textSize.width + offer * 2, textSize.height + offer)
        }
        
         cellHeight = CGRectGetMaxY(textBtnFrame!) + appding
        
    }
    
    class func chatCellFrames(models: [MessageModel]) -> [ChatCellFrame] {
        
        let count = models.count
        var arrMtb = [ChatCellFrame]()
        
        for i in 0..<count {
            
            let chatCellFrame:ChatCellFrame = ChatCellFrame(messageModel: models[i])
            arrMtb.append(chatCellFrame)
        }
        return arrMtb
    }
}
