//
//  GuoQiView.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/16.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class GuoQiView: UIView {
    
    @IBOutlet weak var pickView: UIPickerView!
    
    var model: [GuoQiModel] = GuoQiModel.guoQiModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // 这里连线是没用的
        pickView.delegate = self
        pickView.dataSource = self
    }
}

extension GuoQiView: UIPickerViewDataSource {
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return model.count
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return 75.0
    }
}

extension GuoQiView: UIPickerViewDelegate {
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let cell = NSBundle.mainBundle().loadNibNamed("GuoQiPickViewCell", owner: nil, options: nil).last as! GuoQiPickViewCell
        
        cell.guoQiModel = model[row]
        
        return cell
    }
    
}




