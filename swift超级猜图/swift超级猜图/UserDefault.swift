//
//  UserDefault.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/18.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class UserDefault: NSObject {

    class func stringForKey(defaultName: String) -> String? {
        
        return NSUserDefaults().stringForKey(defaultName)
    }
    
    class func boolForKey(defaultName: String) -> Bool? {
    
       return  NSUserDefaults().boolForKey(defaultName)
    }
    
    class func setValue(value: AnyObject?,forKey: String)() {
    
        NSUserDefaults().setValue(value, forKey: forKey)
    }
    
    class func setBool(bool: Bool?,forKey: String){
        
        NSUserDefaults().setBool(bool!, forKey: forKey)
    }
    
    
}
