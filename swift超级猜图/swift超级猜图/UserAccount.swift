//
//  UserAccount.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/18.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class UserAccount: NSObject, NSCoding {

    var name:NSString?
    var password:NSString?
    
    override init() {
        
        
    }
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(password, forKey: "password")
    }
    
    required  init(coder aDecoder: NSCoder) {
        
        super.init()
        self.name = aDecoder.decodeObjectForKey("name") as? NSString
        self.password = aDecoder.decodeObjectForKey("password") as? NSString
    }
}

