//
//  GuoQiVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/16.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class GuoQiVc: UIViewController {

//    var model: [GuoQiModel] = GuoQiModel.guoQiModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let guoQiView = NSBundle.mainBundle().loadNibNamed("GuoQiView", owner: nil, options: nil).last as! GuoQiView
        guoQiView.frame = view.bounds
        guoQiView.backgroundColor = UIColor.orangeColor()
        view.addSubview(guoQiView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
