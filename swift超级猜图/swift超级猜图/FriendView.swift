//
//  FriendView.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/14.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class FriendView: UIView {

    var tableView: UITableView = UITableView.init(frame: CGRectZero, style: UITableViewStyle.Plain)
    var group: [FriendGroup]?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
         self.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        // 注册
        let nibCell = UINib(nibName: "FriendCell", bundle: nil)
        tableView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)
        tableView.registerNib(nibCell, forCellReuseIdentifier: "FriendCell")
       
        let nibHeader = UINib(nibName: "FriendHeaderView", bundle: nil)
        tableView.registerNib(nibHeader, forHeaderFooterViewReuseIdentifier: "headerCell")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupModel(group: [FriendGroup]) {
        
        self.group = group
        tableView.reloadData()
    }
}

// MARK: - 数据源方法
extension FriendView: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        var count = 0
        if self.group?.count != nil {
            
            count = self.group!.count
        }
        return count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        var count = 0
//        if self.group![section].friends?.count != nil {
//            
//            count = self.group![section].friends!.count
//        } else {
//            
//            return count
//        }
//        
        
//        var count = 0
        let friendGroup: FriendGroup = self.group![section]
        if friendGroup.friends?.count != nil {
            
            count = friendGroup.friends!.count
        }
        if  friendGroup.open == true {
            
            return count
        } else {
            return 0
        }
        
        return count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell") as! FriendCell
        
        let friendsGroup = self.group![indexPath.section]
        let friend = friendsGroup.friends![indexPath.row]
        cell.model = friend as? FriendModel
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 44
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView: FriendHeaderView = tableView.dequeueReusableHeaderFooterViewWithIdentifier("headerCell") as! FriendHeaderView
        headerView.friendGroup = self.group![section]
        headerView.delegate = self
        
        headerView.transForm()
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 44
    }
}

extension FriendView: UITableViewDelegate {
    
    
}

extension FriendView: FriendHeaderViewDelegate {
    
    func friendHeaderViewDidClick(headerView: FriendHeaderView) {
        
        let friendGroup = headerView.friendGroup
        let index = self.group?.indexOf(friendGroup!)
        
        let indexSet:NSIndexSet = NSIndexSet(index: index!)
        tableView.reloadSections(indexSet, withRowAnimation: UITableViewRowAnimation.None)
        headerView.transForm()
//        tableView.reloadData()
    }
}



