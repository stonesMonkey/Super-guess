//
//  PuBuLiuVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/15.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class PuBuLiuVc: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       let puBuView =  NSBundle.mainBundle().loadNibNamed("PuBuView", owner: nil, options: nil).last as! PuBuView
        view.addSubview(puBuView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

    

}
