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
    
    var showKeyBoard: Bool = false
    
    lazy var keyBoardView: KeyBoardView? = {
    
        let keyBoard: KeyBoardView = NSBundle.mainBundle().loadNibNamed("KeyBoardView", owner: nil, options: nil).last as! KeyBoardView
        keyBoard.textFiled.delegate = self
        return keyBoard
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height - 44)
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
        
        // 键盘View,放到最下
        keyBoardView?.frame = CGRectMake(0, UIScreen.mainScreen().bounds.size.height - 44, UIScreen.mainScreen().bounds.size.width, 44)
        self.addSubview(keyBoardView!)
        
        // 注册键盘通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardFrameChange:", name: UIKeyboardWillChangeFrameNotification, object: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setChatCellFrame(chatCellFrames: [ChatCellFrame]) {
        
        self.chatCellFrames = chatCellFrames
        
        tableView.reloadData()
    }
    
    // 
    func keyBoardFrameChange(notification: NSNotification) {
        
        let userInfo = notification.userInfo
        self.showKeyBoard = !self.showKeyBoard
        let timer = userInfo![UIKeyboardAnimationDurationUserInfoKey]!.doubleValue
        // 两种高度的状态
        if showKeyBoard == true {
            
            let rect = userInfo![UIKeyboardFrameEndUserInfoKey]!.CGRectValue
            
           
            let offset:CGFloat = UIScreen.mainScreen().bounds.size.height - rect.origin.y
            UIView.animateWithDuration(timer, animations: { () -> Void in
                
                // 这种不应该用
                 self.keyBoardView?.transform = CGAffineTransformMakeTranslation(0, -offset)
                self.tableView.transform = CGAffineTransformMakeTranslation(0, -offset)
            })
           
        } else {
            
            UIView.animateWithDuration(timer, animations: { () -> Void in
                
                // 这种不应该用
                self.keyBoardView?.transform = CGAffineTransformIdentity
                self.tableView.transform = CGAffineTransformIdentity
            })
        }
    }
    
    func sendMessage(text: String, type: NSNumber) {
        
        // 创建一个model
        let date = NSDate(timeIntervalSinceNow: 0)
        // 获取当前的 时间
        let matter = NSDateFormatter()
        matter.dateFormat = "yyyy-MM-dd"
        let str = matter.stringFromDate(date)
        let model:MessageModel = MessageModel(type: type, text:text, time: str)
        let cellFrame = ChatCellFrame.init(messageModel: model)
        self.chatCellFrames?.append(cellFrame)
        tableView.reloadData()
        let offset = CGPointMake(0, self.tableView.contentSize.height - self.tableView.frame.size.height)
        tableView.setContentOffset(offset, animated: true)
    
    }
    
    func backMessage(text: String) {
        
        sendMessage(text,type: 1)
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
        // 把上一次的时间穿过去 // 这样是不好的
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
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
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
        self.endEditing(true)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.endEditing(true)
    }
    
}

extension ChatView: UITableViewDelegate {
    
}

extension ChatView: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if (textField.text?.characters.count > 0) {
            
            sendMessage(textField.text!,type: 0)
//            let indexPath = Utils.indexPathFor(self.chatCellFrames!.count - 1, inSection: 0)
//            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
            // swift刷新行的方法不行暂时
            // 这个就蛋疼了为什么不行
            
            
            self.performSelector("backMessage:", withObject: "哈哈哈哈哈哈", afterDelay: 1.5)
        }
        return true
    }
    
    
    
}