//
//  ZZDateTool.swift
//  WangYi2
//
//  Created by WZZ on 16/7/26.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZDateTool: NSObject {

    // 将String转换成NSDate
    class func stringForDate(date: NSDate) -> String {
        
        let formmater = NSDateFormatter()
        formmater.dateFormat = "HH:mm"
        return formmater.stringFromDate(date)
    }
    
    class func dateWithString(str: String) -> NSDate {
        
        let formmater = NSDateFormatter()
        formmater.dateFormat = "HH:mm"
        return formmater.dateFromString(str)!
    }
}

