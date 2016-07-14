//
//  ChatView.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/14.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ChatView: UIView {

    var tableView: UITableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)

    var chatCellFrames: [ChatCellFrame]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.frame = frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.orangeColor()
        let bgView = UIImageView(frame: frame)
        bgView.image = UIImage(named: "people_caoying")!
        tableView.backgroundView = bgView
        // 注册
        let nib: UINib = UINib(nibName: "ChatCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "ChatCell")
        self.addSubview(tableView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setChatCellFrame(chatCellFrames: [ChatCellFrame]) {
        
        self.chatCellFrames = chatCellFrames
        
        tableView.reloadData()
    }
}

extension ChatView: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.chatCellFrames?.count != nil {
            
            return self.chatCellFrames!.count
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: ChatCell = tableView.dequeueReusableCellWithIdentifier("ChatCell") as! ChatCell
        cell.chatCellFrame = self.chatCellFrames![indexPath.row]
        // 把上一次的时间穿过去
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if self.chatCellFrames![indexPath.row].cellHeight == nil {
            
            return 0
        } else {
            
            return self.chatCellFrames![indexPath.row].cellHeight!
        }
        
//        return 300.0
        
    }
}

extension ChatView: UITableViewDelegate {
    
}