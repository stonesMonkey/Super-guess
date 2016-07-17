//
//  CitiesModel.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/17.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class CitiesModel: NSObject {
    
    var cities: NSArray?
    var name: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    class func models() -> [CitiesModel] {
        
        let path = NSBundle.mainBundle().pathForAuxiliaryExecutable("cities.plist")
        let arr = NSArray(contentsOfFile: path!)
        var arrMtb = [CitiesModel]()
        let count = arr!.count
        for i in 0..<count {
            
            let dict = arr![i]
            let model = CitiesModel(dict: dict as! [String : AnyObject])
            arrMtb.append(model)
        }
        return arrMtb
    }
}
