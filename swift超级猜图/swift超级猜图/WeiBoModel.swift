//
//  WeiBoModel.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/12.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class WeiBoModel: NSObject {

    var text: String?
    var icon: String?
    var name: String?
    var vip: NSNumber?
    var picture: String?
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
        
    }
    
    class func models() -> [WeiBoModel] {
    
        let path = NSBundle.mainBundle().pathForResource("statuses.plist", ofType: nil)
        let arr = NSArray(contentsOfFile: path!)
        var mtbArr: [WeiBoModel] = [WeiBoModel]()
        
        for i in 0..<arr!.count {
            
            let model = WeiBoModel(dict: arr![i] as! [String : AnyObject])
            mtbArr.append(model)
        }
        return mtbArr
    }
}
