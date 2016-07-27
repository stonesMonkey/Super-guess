//
//  ZZProductModel.swift
//  WangYi2
//
//  Created by WZZ on 16/7/26.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZProductModel: NSObject {
    /**
    "title": "邮箱大师",
    "stitle":"网易推出的通用邮箱APP",
    "id": "com.netease.mailmaster",
    "url": "https://itunes.apple.com/cn/app/you-xiang-da-shi/id897003024?mt=8",
    "icon": "mail@2x.png",
    "customUrl": "mailmaster"
    */
    var title: String?
    var stitle: String?
    var id: String?
    var url: String?
    var icon: String?
    var customUrl: String?
    
    init(dict:[String: String]) {
        super.init()
//        setValuesForKeysWithDictionary(dict)
        self.title = dict["title"]! as String
        let icon: String = dict["icon"]!
         self.icon = icon.componentsSeparatedByString("@").first

    }
    
    override func setValuesForKeysWithDictionary(keyedValues: [String : AnyObject]) {}
}
