//
//  AppModel.swift
//  One
//
//  Created by WZZ on 16/7/3.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class AppModel: NSObject {
    
    var imageName: String?
    var appName: String?
    
    override init() {
        super.init()
    }
    
    init(imageName: String, appName: String) {
        
        super.init()
        self.imageName = imageName
        self.appName = appName
    }
    func models() -> [AppModel]{
        
        let path: String = NSBundle.mainBundle().pathForResource("app.plist", ofType: nil)!;
        
        let arr = NSArray(contentsOfFile: path)

        var mtbArr: [AppModel] = NSArray() as! [AppModel];
        for i in 0..<arr!.count {
            
            let dic:[String: AnyObject] = arr![i] as! [String: AnyObject];
            let model = AppModel(imageName: dic["icon"] as! String, appName: dic["name"] as! String);
            
            mtbArr.append(model)
        }
        
        return mtbArr
        
    }
}
