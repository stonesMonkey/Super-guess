//
//  AddVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/17.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

protocol AddVcDelegate: NSObjectProtocol {
    
    func AddVcAddBtnDidClick(addVc: AddVc,model: UserFriendModel)
}

class AddVc: UIViewController {
    
    
    weak var delegate: AddVcDelegate?
    @IBOutlet weak var friendName: UITextField!
    
    @IBOutlet weak var phoneName: UITextField!
    
    @IBOutlet weak var addBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = UIRectEdge.None
        
        // 添加事件
        friendName.addTarget(self, action: "textFiledValueChange", forControlEvents: UIControlEvents.EditingChanged)
        phoneName.addTarget(self, action: "textFiledValueChange", forControlEvents: UIControlEvents.EditingChanged)
    }
    
    
}

extension AddVc {
    
    
    @IBAction func addBtnDidClick(sender: UIButton) {
        
        if self.delegate != nil {
            
            let model = UserFriendModel()
            model.name = friendName.text
            model.phone = phoneName.text
            self.delegate?.AddVcAddBtnDidClick(self, model: model)
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func textFiledValueChange() {
        
        if  friendName.text?.characters.count > 0 && phoneName.text?.characters.count > 0 {
            
            addBtn.enabled = true
        } else {
            
            addBtn.enabled = false
        }
    }
    
    
    
}
