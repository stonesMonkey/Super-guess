//
//  QQChatVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/14.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class QQChatVc: UIViewController {

    var chatCellFrame:[ChatCellFrame] = ChatCellFrame.chatCellFrames(MessageModel.models())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let chatView = ChatView(frame: self.view.bounds)
        view.addSubview(chatView)
        
        chatView.setChatCellFrame(chatCellFrame)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    deinit {
        
    }

}
