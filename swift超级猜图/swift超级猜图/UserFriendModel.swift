//
//  UserFriendModel.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/18.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class UserFriendModel: NSObject,NSCoding {
    
    var name: NSString?
    var phone: NSString?
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init()
        // 因为用 String 类型会报错
        self.name =  aDecoder.decodeObjectForKey("name") as? NSString
        self.phone = aDecoder.decodeObjectForKey("phone") as? NSString
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeObject(self.phone, forKey: "phone")
    }
    
    
}
