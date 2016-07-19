//
//  GestureTwoVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/19.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class GestureTwoVc: UIViewController {

    
    @IBOutlet weak var yellowView: YellowView!
    
    @IBOutlet weak var btn: RedBtn!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.btn.addTarget(self, action: "btnDidClick", forControlEvents: UIControlEvents.TouchDown)
        
        yellowView.btn = self.btn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        print("控制器的View处理了这个事件")
    }
    
    func btnDidClick() {
        
        print("123456")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
