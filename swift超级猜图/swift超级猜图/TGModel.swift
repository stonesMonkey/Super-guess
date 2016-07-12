//
//  TGModel.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/12.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class TGModel: NSObject {
    
    var buyCount:String?
    var icon: String?
    var price: String?
    var title: String?
    
    override init() {
        super.init()
    }
    
    init(dict: [String: AnyObject]) {
        
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    class func tgModels() -> [TGModel]  {
    
        let path:String = NSBundle.mainBundle().pathForResource("tgs.plist", ofType: nil)!
        let arr = NSArray(contentsOfFile: path)
        var arrMtb = [TGModel]()
        
        for i in 0..<arr!.count {
            
            let dict = arr![i] as! [String: AnyObject]
            let model = TGModel(dict: dict)
            arrMtb.append(model)
        }
        return arrMtb
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
