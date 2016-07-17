//
//  UserAddressVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/17.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit
import SVProgressHUD

class UserAddressVc: UIViewController {

    @IBOutlet weak var userField: UITextField!
    
    @IBOutlet weak var passFiled: UITextField!
    
    @IBOutlet weak var savePasswordSwitch: UISwitch!
    
    @IBOutlet weak var automicLogin: UISwitch!
    
    @IBOutlet weak var loginBtn: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = UIRectEdge.None
        
        // 添加事件
        userField.addTarget(self, action: "filedValueChange:", forControlEvents: UIControlEvents.EditingChanged)
        
        passFiled.addTarget(self, action: "filedValueChange:", forControlEvents: UIControlEvents.EditingChanged)
    }
    
    deinit {
        
    }

}

extension UserAddressVc { // action
    
    @IBAction func loginBtnDidClick(sender: UIButton) {
        
        SVProgressHUD.showWithStatus("正在登录请稍后")
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.None)
        
        Utils.GCDWithTimer(0.5) { () -> Void in
            
            // 判断账号密码
            if  self.userField.text == "123" && self.passFiled.text == "123" { // 登录成功
                
                SVProgressHUD.showSuccessWithStatus("登录成功")
                SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.Black)
                
                Utils.GCDWithTimer(0.5, block: { () -> Void in
                    
                    SVProgressHUD.dismiss()
                    self.navigationController?.pushViewController(LianXiVc(), animated: true)
                })
            } else { // 账号密码错误
                
                SVProgressHUD.showErrorWithStatus("账号或者密码错误")
                SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.None)
                Utils.GCDWithTimer(0.5, block: { () -> Void in
                    
                    SVProgressHUD.dismiss()
                })
            }
        }
        
    }
    
    func filedValueChange(send: UITextField) {
        
        // 判断
        if userField.text?.characters.count > 0 && passFiled.text?.characters.count > 0 {
            
            self.loginBtn.enabled = true
        } else {
            
            self.loginBtn.enabled = false
            
            
        }
    }

}

// MARK: -DEINIT
extension UserAddressVc {
    
   
}
