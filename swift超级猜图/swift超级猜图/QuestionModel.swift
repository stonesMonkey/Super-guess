//
//  GuanQiaModel.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/8.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class QuestionModel: NSObject {
    
// warn -- 血的教训告诉我们创建Model类型不能用let

     var answer:String?
    {
        
        didSet {
            
            let lenght:Int = answer!.characters.count
            
            let answerStr = answer! as NSString
            for i in 0..<lenght {
                
//                let end = answer!.endIndex.advancedBy(lenght - i)
                
//                let range = start..<end
                let index = answerStr.substringWithRange(NSMakeRange(i, 1))
                answerWord.append(index)
            }
        }
    }
    
    override init() {
        super.init()
        
    }
    
     convenience init(dict:[String:AnyObject]) {
        
        self.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    var answerWord: [String] = [String]()
    var icon: String?
    var title: String?
    var options: [String]?
    
     class func questionModels() -> [QuestionModel] {
        
        let path: String = NSBundle.mainBundle().pathForResource("questions.plist", ofType: nil)!
        let arr:NSArray = NSArray(contentsOfFile: path)!
        
        var arrMtb = [QuestionModel]()
        for i in 0..<arr.count {
            
            let dic:[String:AnyObject] = arr[i] as! [String : AnyObject]
            let questionModel = QuestionModel(dict: dic)

            arrMtb.append(questionModel)
        }
        
        return arrMtb
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
}
