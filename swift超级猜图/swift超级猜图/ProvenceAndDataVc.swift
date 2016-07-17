//
//  ProvenceAndDataVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/17.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ProvenceAndDataVc: UIViewController {

//    var dataKeyBoard:UIDatePicker =  {
//        
//        let datePicker = UIDatePicker()
//        datePicker.maximumDate = NSDate(timeIntervalSinceNow: 20 * 365 * 24 * 60 * 60)
//        datePicker.minimumDate = NSDate(timeIntervalSinceNow: -10 * 365 * 24 * 60 * 60)
//        datePicker.datePickerMode = UIDatePickerMode.DateAndTime
//        datePicker.locale = NSLocale(localeIdentifier: "zh")
//        
//        return datePicker
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = UIRectEdge.None
        let province: ProvinceAndDataView = NSBundle.mainBundle().loadNibNamed("ProvinceAndDataView", owner: nil, options: nil).last as! ProvinceAndDataView
        province.frame = view.bounds
//        province.dataTextView.inputView = dataKeyBoard
        view.addSubview(province)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
