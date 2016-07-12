//
//  CarGroup.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/11.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class CarGroup: NSObject {
    
    var cars: [[String: AnyObject]]?
    var title: String?
    var carModels: [Car]?
    init(dict:[String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
        carModels = [Car]()
        for i in 0..<cars!.count {
            
            let dict: [String: AnyObject] = self.cars![i]
            let carModel:Car = Car(dict: dict)
            carModels?.append(carModel)
        }
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    
     class func carGroups() -> [CarGroup] {
        
        let path = NSBundle.mainBundle().pathForResource("cars_total.plist", ofType: nil)
        let arr = NSArray(contentsOfFile: path!)
        var arrMtb = [CarGroup]()
        for i in 0..<arr!.count {
            
            let dict: [String: AnyObject] = arr![i] as! [String: AnyObject]
            let carGroup = CarGroup(dict: dict)
            arrMtb.append(carGroup)
        }
        return arrMtb
    }
}
