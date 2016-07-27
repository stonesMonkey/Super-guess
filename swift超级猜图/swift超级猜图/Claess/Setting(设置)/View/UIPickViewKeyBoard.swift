//
//  UIPickViewKeyBoard.swift
//  WangYi2
//
//  Created by WZZ on 16/7/26.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

protocol UIPickViewKeyBoardDelegate: NSObjectProtocol {
    
    func pickViewKeyBoardsureBtnDidClick(keyBoard: UIPickViewKeyBoard)
    func pickViewKeyBoardcanCelBtnDidClick(keyBoard: UIPickViewKeyBoard)
    func pickViewKeyBoardValueChange(keyBoard: UIPickViewKeyBoard, dateStr: String)
}

class UIPickViewKeyBoard: ZZBaseView {

    
    @IBOutlet weak var sureBtn: UIButton!
    
    @IBOutlet weak var cancelBtn: UIButton!
    
    weak var delegate: UIPickViewKeyBoardDelegate?
    
    var minniDate: NSDate?
    var maxDate: NSDate?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBAction func sureBtnClick(sender: UIButton) {
        
        if (self.delegate != nil) {
            
            self.delegate?.pickViewKeyBoardsureBtnDidClick(self)
        }
    }
    
    func setupMinDate(date: NSDate) {
        
        self.datePicker.minimumDate = date
        self.minniDate = date
    }
    
    func setupMaxDate(date: NSDate) {
        
        self.datePicker.maximumDate = date
        self.maxDate = date
    }
    
    @IBAction func canCelBtnDidClick(sender: UIButton) {
       
        if (self.delegate != nil) {
            
            self.delegate!.pickViewKeyBoardcanCelBtnDidClick(self)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        datePicker.addTarget(self, action: "datePickViewValueChang", forControlEvents: UIControlEvents.ValueChanged)
//        datePicker.locale = NSLocale(localeIdentifier "zh")
        datePicker.datePickerMode = UIDatePickerMode.Time
        datePicker.locale = NSLocale.systemLocale()
    }
    
}

// action
extension UIPickViewKeyBoard {
    
    func datePickViewValueChang() {
        
//        let date = datePicker.date
//        let formatter = NSDateFormatter()
//        formatter.dateFormat = "HH:mm"
        // 转换成String
       let dateStr = ZZDateTool.stringForDate(datePicker.date)
        // 传出去
        if self.delegate != nil {
            
            self.delegate?.pickViewKeyBoardValueChange(self,dateStr: dateStr)
        }
    }
}
