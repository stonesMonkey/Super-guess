//
//  ZZWoDeVc.swift
//  WangYi2
//
//  Created by WZZ on 16/7/22.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZWoDeVc: ZZBaseVc {
    
    lazy var loginVc: ZZBaseVc = {
    
        let vc = ZZLoginVc()
        vc.title = "登录"
        vc.view.backgroundColor = UIColor.orangeColor()
        return vc
    }()
    
    @IBOutlet weak var bgIconView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgIconView.userInteractionEnabled = true
        
        // 添加一个手势
        let tap = UITapGestureRecognizer(target: self, action: "tapAction:")
        bgIconView.addGestureRecognizer(tap)
    }
}


// action
extension ZZWoDeVc {
    
    
    @IBAction func tapAction(sender: AnyObject) {
        
        
        let nav = ZZBaseNavigationVc(rootViewController: loginVc)
        
        
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    
    @IBAction func loginBtn(sender: UIButton) {
        
        let nav = ZZBaseNavigationVc(rootViewController: loginVc)
        
        
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    @IBAction func settingDidClick(sender: AnyObject) {
        
        
    }
    
    
    
}
