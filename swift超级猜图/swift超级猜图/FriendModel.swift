//
//  FriendModel.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/14.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class FriendModel: NSObject {
    
    var icon: String?
    var name: String?
    var intro: String?
    var vip: NSNumber?
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    class func friends(dicts: [[String: AnyObject]]) -> [FriendModel] {
    
        let count = dicts.count
        var arrMtb = [FriendModel]()
        for i in 0..<count {
            
            let friend = FriendModel(dict: dicts[i])
            arrMtb.append(friend)
        }
        
        return arrMtb
    }
}
