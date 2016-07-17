//
//  GuoQiModel.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/16.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class GuoQiModel: NSObject {
    
    var name: String?
    var icon: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
    }
    
    
    
   class func guoQiModel() -> [GuoQiModel] {
        
        let path = NSBundle.mainBundle().pathForAuxiliaryExecutable("flags.plist")
        let arr = NSArray(contentsOfFile: path!)
        var arrMtb = [GuoQiModel]()
        
        for i in 0..<arr!.count {
            
            let model = GuoQiModel(dict: arr![i] as! [String : AnyObject])
            arrMtb.append(model)
        }
        return arrMtb
    }
}
