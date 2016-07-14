//
//  QQFriendListVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/14.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class QQFriendListVc: UIViewController {

    var friendsView:FriendView?
    
    var friendGroup = FriendGroup.friendsGroups()
    
    override func viewDidLoad() {
      super.viewDidLoad()
        
        friendsView = FriendView(frame: self.view.bounds)
        friendsView!.backgroundColor = UIColor.orangeColor()
        
        view.addSubview(friendsView!)
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            
            self.friendsView?.setupModel(self.friendGroup)
        }
    }
}
