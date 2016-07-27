//
//  ZZBiFenZhiBoVc.swift
//  WangYi2
//
//  Created by WZZ on 16/7/24.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

// 因为时间的原因一些细节在这里就不写了
class ZZBiFenZhiBoVc: ZZSettingBaseVc {

    lazy var keyboard: UIPickViewKeyBoard = {
       
        let keyboardView = NSBundle.mainBundle().loadNibNamed("UIPickViewKeyBoard", owner: nil, options: nil).last as! UIPickViewKeyBoard
        keyboardView.delegate = self
        keyboardView.frame = CGRectMake(0, UIScreen.mainScreen().bounds.size.height, UIScreen.mainScreen().bounds.size.width, 260)
        self.view.addSubview(keyboardView)
        
        return keyboardView
    }()
    
    lazy  var touMingBtn: UIButton = {
    
        let btn = UIButton(type: UIButtonType.Custom)
        self.view.addSubview(btn)
        btn.addTarget(self, action: "touMingBtnDidClick", forControlEvents: UIControlEvents.TouchDown)
        btn.frame = CGRectMake(0,0,UIScreen.mainScreen().bounds.size.width,UIScreen.mainScreen().bounds.size.height - 260)
        btn.backgroundColor = UIColor.clearColor()
        btn.hidden = true
        return btn
    }()
    
    var minniDate: NSDate? {
        
        didSet {
            
            self.keyboard.setupMinDate(minniDate!)
        }
    }
    var maxDate: NSDate? {
        
        didSet {
            
            self.keyboard.setupMaxDate(maxDate!)
        }
    }
    
    // 记录当前点击的cellModel
    var selectIndexPath: NSIndexPath?
    
    // 当前pickView选中的时间
    var currentCellSelectStr: String?
    
    // pickViewkeyBoard出来之前的时间
    override func viewDidLoad() {
        super.viewDidLoad()

        let tuiSong = ZZSwitchModel(iconName: nil, title: "推送我关注的比赛")
        
        let group1 = ZZGroupItemModel(cells: [tuiSong], headerTitle: nil, footerTitle: "发发发发发发啊发发发发发发啊发发发发发发啊发发发发发发啊发发发发发发啊 ")
        groups?.append(group1)
        
        self.minniDate = ZZDateTool.dateWithString("00:00")
        self.maxDate = ZZDateTool.dateWithString("12:00")
        let beginTime = ZZTitleLabelModel(title: "起始时间", accessLabel: "00:00", block: { [weak self] () -> () in
            
            self!.selectIndexPath = ZZOCTool.section(1, row: 0)
            self?.maxDate = ZZDateTool.dateWithString("12:00")
//            self?.keyboard.datePicker.setDate(ZZDateTool.dateWithString("00:00"), animated: false)
            self?.keyboard.datePicker.date = ZZDateTool.dateWithString("00:00")
            // 弹出键盘
            self!.showKeyBoard()
        })
        
        let group2 = ZZGroupItemModel(cells: [beginTime], headerTitle: "NONONONONONONONONONONONONONONONONONONONONONONONO", footerTitle: nil)
        groups?.append(group2)
        
        let endTime = ZZTitleLabelModel(title: "结束时间", accessLabel: "12:00",block: { [weak self] () -> () in
            
            self!.selectIndexPath = ZZOCTool.section(2, row: 0)
            self!.minniDate = ZZDateTool.dateWithString("00:00")
            self?.keyboard.datePicker.date = ZZDateTool.dateWithString("12:00")
//            self?.keyboard.datePicker.setDate(ZZDateTool.dateWithString("12:00"), animated: false)
            self!.showKeyBoard()
        })
        
        let group3 = ZZGroupItemModel(cells: [endTime], headerTitle: nil, footerTitle: nil)
        groups?.append(group3)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func showKeyBoard() {
        
        touMingBtn.hidden = false
        // 如果选择的是最小时间
        if selectIndexPath?.section == 1 {
            
            self.keyboard.setupMinDate(self.minniDate!)
        } else {
            
            self.keyboard.setupMaxDate(self.maxDate!)
        }
        
        UIView.animateWithDuration(0.25) { () -> Void in
            
            self.keyboard.transform = CGAffineTransformMakeTranslation(0, -260)
        }
        
        
    }
    
    func hidenKeyBoard() {
        
        UIView.animateWithDuration(0.25) { () -> Void in
            
            self.touMingBtn.hidden = true
            self.keyboard.transform = CGAffineTransformIdentity
        }
    }
}

extension ZZBiFenZhiBoVc {
    
    func touMingBtnDidClick() {
        
        hidenKeyBoard()
    }
}

extension ZZBiFenZhiBoVc: UIPickViewKeyBoardDelegate {
    
    func pickViewKeyBoardcanCelBtnDidClick(keyBoard: UIPickViewKeyBoard) { //  取消
        
        
        hidenKeyBoard()
    }
    
    func pickViewKeyBoardsureBtnDidClick(keyBoard: UIPickViewKeyBoard) { // 确定
        
        if selectIndexPath?.section == 1 {
            
            self.minniDate = ZZDateTool.dateWithString(self.currentCellSelectStr!)
        } else {
            
            self.maxDate = ZZDateTool.dateWithString(self.currentCellSelectStr!)
        }
        
        hidenKeyBoard()
    }
    
    func pickViewKeyBoardValueChange(keyBoard: UIPickViewKeyBoard, dateStr: String) {
        
        
       
        // 改变cell
        let group = self.groups![self.selectIndexPath!.section]
        let cellModel = group.cells![selectIndexPath!.row] as! ZZTitleLabelModel
        cellModel.accessLabel = dateStr
        self.currentCellSelectStr = dateStr
        tableView.reloadRowsAtIndexPaths([selectIndexPath!], withRowAnimation: UITableViewRowAnimation.None)
        // 判断时间
    }
    
    
}
