//
//  Data+Category.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/17.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import Foundation

extension NSDate {
    
    class func stringFormData(date: NSDate) -> String {
        
        let matter = NSDateFormatter()
        matter.dateFormat = "yyyy-MM-dd"
        let str = matter.stringFromDate(date)
        return str
    }
}