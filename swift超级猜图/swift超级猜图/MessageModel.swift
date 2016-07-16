//
//  MessageModel.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/14.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class MessageModel: NSObject {
    
    var type: NSNumber?
    var text: String?
    var time: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override init() {
        super.init()
    }
    
    convenience init(type: NSNumber?, text: String?, time: String?) {
        self.init()
        self.type = type
        self.text = text
        self.time = time
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    class func models() -> [MessageModel] {
    
        let path = NSBundle.mainBundle().pathForResource("messages.plist", ofType: nil)
        let arr: NSArray = NSArray(contentsOfFile: path!)!
        var arrMtb: [MessageModel] = [MessageModel]()
        let count = arr.count
        for i in 0..<count {
            
            let dict: [String: AnyObject] = arr[i] as! [String : AnyObject]
            let model = MessageModel(dict: dict)
            arrMtb.append(model)
        }
        return arrMtb
    }
}
