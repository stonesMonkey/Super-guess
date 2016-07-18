//
//  BianJiVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/18.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol BianJiVcDelegate: NSObjectProtocol {
    
    func BianJiVcSaveBtnDidClick(bianji:BianJiVc, model: UserFriendModel)
}

class BianJiVc: UIViewController {
    
    weak var delegate: BianJiVcDelegate?
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    var model: UserFriendModel?
    
    lazy var bianJiBtn: UIButton = {
        
        let btn = UIButton(frame: CGRectMake(0, 0, 44, 40), title: "编辑", titleColor: UIColor.blueColor(), fontSize: 12)
        btn.setTitle("取消", forState: UIControlState.Selected)
        
        btn.addTarget(self, action: "bianJiBtnDidClick", forControlEvents: UIControlEvents.TouchDown)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = UIRectEdge.None
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: bianJiBtn)
        
        nameField.text = model!.name as? String
        phoneField.text = model!.phone as? String
        
        nameField.enabled = false
        phoneField.enabled = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

// action
extension BianJiVc {
    
    func bianJiBtnDidClick() {
        
        self.bianJiBtn.selected = !self.bianJiBtn.selected
        let select = self.bianJiBtn.selected
        nameField.enabled = select
        phoneField.enabled = select
        
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.OverrideInheritedOptions, animations: { () -> Void in
            
            self.saveBtn.hidden = !select
            }, completion: nil)
        
        if select {
            
            phoneField.becomeFirstResponder()
        }
    }
    
    
    @IBAction func saveBtnDidClick(sender: UIButton) {
        
        if nameField.text?.characters.count > 0 && phoneField.text?.characters.count > 0 {
            
            
            if delegate != nil {
                
                SVProgressHUD.showSuccessWithStatus("修改成功")
                
                self.model?.name = self.nameField.text
                self.model?.phone = self.phoneField.text
                self.delegate!.BianJiVcSaveBtnDidClick(self, model: self.model!)
                
                Utils.GCDWithTimer(0.5, block: { () -> Void in
                    
                    SVProgressHUD.dismiss()
                    self.navigationController?.popViewControllerAnimated(true)
                })
            }
            
            
        } else {
            
            SVProgressHUD.showErrorWithStatus("用户或者号码为空!!")
            //            SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.Custom)
            Utils.GCDWithTimer(0.5, block: { () -> Void in
                
                SVProgressHUD.dismiss()
            })
        }
        
    }
    
}
