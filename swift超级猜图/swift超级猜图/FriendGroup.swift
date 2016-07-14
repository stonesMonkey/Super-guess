//
//  FriendGroup.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/14.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class FriendGroup: NSObject {

    var friends: NSArray?
    var name: String?
    // 在线人数
    var online: NSNumber?
    
    var open: Bool = false
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
        friends = FriendModel.friends(friends as! [[String: AnyObject]])
    }
    
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
    class func friendsGroups() -> [FriendGroup] {
        
        let path = NSBundle.mainBundle().pathForResource("friends.plist", ofType: nil)
        let arr = NSArray(contentsOfFile: path!)
        var arrMtb = [FriendGroup]()
        let count = arr!.count
        
        for i in 0..<count {
            
            let dict = arr![i] as! [String: AnyObject]
            let friendsGroup = FriendGroup(dict: dict)
            arrMtb.append(friendsGroup)
        }
        
        return arrMtb
    }
}
