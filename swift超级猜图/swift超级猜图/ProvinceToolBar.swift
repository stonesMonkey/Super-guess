//
//  ProvinceToolBarView.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/17.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

protocol ProvinceToolBarDelegate: NSObjectProtocol {
    
    func ProvinceToolBarPreBtnDidClick(toolBar: ProvinceToolBar)
    func ProvinceToolBarNextBtnDidClick(toolBar: ProvinceToolBar)
    func ProvinceToolBarDoneBtnDidClick(toolBar: ProvinceToolBar)
}

class ProvinceToolBar: UIView {

    weak var delegate: ProvinceToolBarDelegate?
    
    override func awakeFromNib() {
        
        
    }
    
    @IBAction func preBtnDidClick(sender: AnyObject) {
        
        if delegate != nil {
            
            delegate!.ProvinceToolBarPreBtnDidClick(self)
        }
    }
    
    @IBAction func nextBtnDidClick(sender: UIButton) {
        
        if delegate != nil {
            
            delegate!.ProvinceToolBarNextBtnDidClick(self)
        }
    }
    
    @IBAction func doneBtnDidClick(sender: UIButton) {
        
        if delegate != nil {
            
            delegate!.ProvinceToolBarDoneBtnDidClick(self)
        }
    }
    
    
    

}
