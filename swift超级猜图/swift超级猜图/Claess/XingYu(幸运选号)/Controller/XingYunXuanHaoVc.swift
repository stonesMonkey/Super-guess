//
//  XingYunXuanHaoVc.swift
//  WangYi2
//
//  Created by WZZ on 16/7/22.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class XingYunXuanHaoVc: ZZBaseVc {
    
    
    @IBOutlet weak var bgImage: UIImageView!
    
    weak var timerTool: ZZTimerTool?
    
    @IBOutlet weak var lightImage: UIImageView!
    
    var light: Bool = false
    
    deinit {
        
        print("幸运选号控制器释放")
    }
    
    override func viewDidLoad() {
        
        if is4inch { // 如果是4s
            
            bgImage.image = UIImage(named: "luck_entry_background@2x.jpg")
        } else { // 如果不是4s
            
            bgImage.image = UIImage(named: "luck_entry_background-568h@2x.jpg")
        }
        
        
    }
    
    func addTimer() { // 添加计时器
        
      self.timerTool =  ZZTimerTool.tool(timeInterval: 0.5, target: self, selector: "bgImageAnimation", userInfo: nil, repeats: true)
    }
    
    func bgImageAnimation() {
        
        light = !light
        if light { // 如果是1
            
            lightImage.image = UIImage(named: "lucky_entry_light1")
        } else {
            
            lightImage.image = UIImage(named: "lucky_entry_light0")
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        addTimer()
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        // 控制器消失的时候删除定时器
        self.timerTool?.dismissTimer()
    }
    
    
    @IBAction func mengXiangBtnClick(sender: AnyObject) {
        
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.orangeColor()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
