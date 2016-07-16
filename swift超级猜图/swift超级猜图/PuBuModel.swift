//
//  PuBuModel.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/15.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class PuBuModel: NSObject {
    
    var height: NSNumber?
    var width: NSNumber?
    var price: String?
    var icon: String?
    
    init(dict: [String: AnyObject]) {
        
        super.init()
        setValuesForKeysWithDictionary(dict)
        
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
    class func puBuModel(str: String) -> [PuBuModel] {
        
        let path = NSBundle.mainBundle().pathForAuxiliaryExecutable("1.plist")
        let arr: NSArray = NSArray(contentsOfFile: path!)!
        let count = arr.count
        var mtbArr = [PuBuModel]()
        for i in 0..<count {
            
            let dict = arr[i]
            let puBuModel = PuBuModel(dict: dict as! [String : AnyObject])
            mtbArr.append(puBuModel)
        }
        return mtbArr
    }
    
}
