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
    
    var userAccount: UserAccount?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = UIRectEdge.None
        
        // 添加事件
        userField.addTarget(self, action: "filedValueChange:", forControlEvents: UIControlEvents.EditingChanged)
        
        passFiled.addTarget(self, action: "filedValueChange:", forControlEvents: UIControlEvents.EditingChanged)
        
        // 添加KVO
        userField.addObserver(self, forKeyPath: "text", options: Utils.newAndOldOptions(), context: nil)
        passFiled.addObserver(self, forKeyPath: "text", options: Utils.newAndOldOptions(), context: nil)
        
        // 接档账号密码
        unencodeUserMessage()
        
        // 获取当前用户偏好设置
        getUserDefault()
    }
    
    
    
    deinit {
        
        // 销毁KVO
        self.userField.removeObserver(self, forKeyPath: "text")
        self.passFiled.removeObserver(self, forKeyPath: "text")
    }
    
}

// MARK: - KVC
extension UserAddressVc {
    
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        if self.userField.text!.characters.count > 0 && self.passFiled.text!.characters.count > 0 {
            
            self.loginBtn.enabled = true
        }
    }
}

// MARK: - Action
extension UserAddressVc {
    
    // 登录按钮点击事件
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
                    
                    // 归档用户的账号密码
                   self.encodeUserMessage()
                    
                    // 保存用户偏好设置
                    self.saveUserDefault()
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
    
    @IBAction func savePasswordClick(sender: UISwitch) {
        
        if savePasswordSwitch.on {
            

        } else {
            
            self.automicLogin.setOn(false, animated: true)
        }
    }
    
    @IBAction func automicLogin(sender: UISwitch) {
        
        if automicLogin.on {
            
            self.savePasswordSwitch.setOn(true, animated: true)
        } else {
            
            
        }
    }
    
    
    
    
}

// MARK: - 用户信息保存
extension UserAddressVc {
    
    // 接档账号密码
    func unencodeUserMessage() {
        
        let contenFile = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.UserDomainMask, true).last?.stringByAppendingString("contact.data")
        
        self.userAccount =  NSKeyedUnarchiver.unarchiveObjectWithFile(contenFile!) as? UserAccount
        if self.userAccount != nil {
            
            self.userField.text = self.userAccount!.name as? String
            self.passFiled.text = self.userAccount!.password as? String
        }
    }
    
    // 归档正好密码
    func encodeUserMessage() {
        
        // 归档保存用户账号密码
        let contenFile = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.UserDomainMask, true).last?.stringByAppendingString("contact.data")
        // userModel
        // 如果为nil
        if self.userAccount == nil {
            
            self.userAccount = UserAccount()
        }
        self.userAccount!.name = self.userField.text
        self.userAccount!.password = self.passFiled.text
        NSKeyedArchiver.archiveRootObject(self.userAccount!, toFile: contenFile!)
    }
    
    // 保存当前用户开关状态
    func saveUserDefault() {
        
        let saveBool = self.savePasswordSwitch.on
        let automicBool = self.automicLogin.on
        
        UserDefault.setBool(saveBool, forKey: "saveBool")
        UserDefault.setBool(automicBool, forKey: "automicBool")
    }
    
    // 获取当前用户的开关状态
    func getUserDefault() {
        
        let saveBool = UserDefault.boolForKey("saveBool")
        let automicBool = UserDefault.boolForKey("automicBool")
        
        if saveBool != nil && automicBool != nil {
         
            self.savePasswordSwitch.on = UserDefault.boolForKey("saveBool")!
            self.automicLogin.on = UserDefault.boolForKey("automicBool")!
        }
    }
}

// MARK: -DEINIT
extension UserAddressVc {
    
    
}
