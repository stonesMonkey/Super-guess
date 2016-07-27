//
//  ZZHelpModel.swift
//  WangYi2
//
//  Created by WZZ on 16/7/26.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZHelpModel: NSObject {

    /**
    "title" : "如何充值？",
    "html" : "help.html",
    "id" : "howtorecharge"
    */
    
    var title: String?
    var html: String?
    var id: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        self.title = dict["title"] as? String
        self.html = dict["html"] as? String
        self.id = dict["id"] as? String
    }
}
