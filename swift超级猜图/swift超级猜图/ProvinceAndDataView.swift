//
//  ProvinceAndDataView.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/17.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit


class ProvinceAndDataView: UIView {

    // 时间选择器
    lazy var dataKeyBoard:UIDatePicker =  {
        
        let datePicker = UIDatePicker()
        datePicker.maximumDate = NSDate(timeIntervalSinceNow: 20 * 365 * 24 * 60 * 60)
        datePicker.minimumDate = NSDate(timeIntervalSinceNow: -10 * 365 * 24 * 60 * 60)
        datePicker.datePickerMode = UIDatePickerMode.Date
        datePicker.locale = NSLocale(localeIdentifier: "zh")
        datePicker.addTarget(self, action: "dataPickAction:", forControlEvents: UIControlEvents.ValueChanged)
        return datePicker
    }()
    
    // toolBar
    lazy var toolBar: ProvinceToolBar = {
       
        let aBar = NSBundle.mainBundle().loadNibNamed("ProvinceToolBar", owner: nil, options: nil).last as! ProvinceToolBar
        
        return aBar
    }()
    
    // 省市pickView
    lazy var provincePickView:UIPickerView = {
        
        let provinceView = UIPickerView()
        provinceView.delegate = self
        provinceView.dataSource = self
    
    
        return provinceView
    }()
    // 省事Model
    lazy var citiesModel: [CitiesModel] = {
        
        return CitiesModel.models()
    }()
    
    @IBOutlet weak var dataTextView: UITextField!
    
    @IBOutlet weak var provenceView: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dataTextView.delegate = self
        provenceView.delegate = self
        
    }
    
}

// action
extension ProvinceAndDataView {
 
    func dataPickAction(sender: UIDatePicker) {
        
        let date = sender.date
        let str = NSDate.stringFormData(date)
        dataTextView.text = str
    }
}

// 键盘代理方法
extension ProvinceAndDataView: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        if (dataKeyBoard.inputView != nil) {
            
            return true
        }
        
        if  textField == dataTextView {
            
            textField.inputView = dataKeyBoard
            textField.inputAccessoryView = toolBar
        } else if textField == provenceView {
            
            provenceView.inputView = provincePickView
            provenceView.inputAccessoryView = toolBar
        }
        
        
        return true
    }
}

// pickView的数据源方法
extension ProvinceAndDataView: UIPickerViewDataSource {
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 2
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            
            return citiesModel.count
        } else if component == 1 {
            
            // 获取第一栏
            let row = pickerView.selectedRowInComponent(0)
            return citiesModel[row].cities!.count
        }
        
        return 0
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            
            return citiesModel[row].name
        } else if component == 1 {
            
            let citiesRow = pickerView.selectedRowInComponent(0)
            
            let model: CitiesModel = citiesModel[citiesRow]
            let cities = model.cities
            return cities![row] as? String
        }
        return ""
    }
}

extension ProvinceAndDataView: UIPickerViewDelegate {
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}



