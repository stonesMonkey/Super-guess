//
//  AnwerView.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/8.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

protocol AnwerViewDelegate: NSObjectProtocol {
    
    func AnwerViewBtnDidClick(str: String)
}

class AnwerView: UIView {
    
    // 定义属性
    var answer:String?
    
    // 定义属性
    weak var delegate: AnwerViewDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    convenience init(model:QuestionModel) {
        
        self.init(frame:CGRectZero)
        
        setupSubView(model.answerWord)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK --添加子控件
extension AnwerView {
    
    func setupSubView(answerWords:[String]) {
        

        for _ in 0..<subviews.count { // 移除所有子控件
            
            self.subviews[0].removeFromSuperview()
        }
        self.answer = String()
        let appding:CGFloat = 10.0
        let width: CGFloat = 44
        let height: CGFloat = 44
        let count = answerWords.count
        let countFloat: CGFloat = CGFloat(answerWords.count)
        let under: CGFloat = (UIScreen.mainScreen().bounds.size.width - (width * countFloat) - (appding * (countFloat - 1))) / 2
        
        for i in 0..<count {
            
            self.answer = answer! + answerWords[i]
            
            let subView = UIButton()
            subView.setTitle("", forState: UIControlState.Normal)
            
            let subViewX: CGFloat = under + CGFloat((i % count)) * (appding + width)
            let subViewY: CGFloat = 0
            subView.frame = CGRectMake(subViewX, subViewY, width, height)
            
            subView.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
            subView.addTarget(self, action: "btnDidClick:", forControlEvents: UIControlEvents.TouchDown)
            subView.backgroundColor = UIColor.whiteColor()
            self.addSubview(subView)
        }
    }
    
    // 按钮点击
    func btnDidClick(btn: UIButton) {
        
        if btn.currentTitle == "" {
            
            return
        }
        if self.delegate != nil {
            
            
            self.delegate!.AnwerViewBtnDidClick(btn.currentTitle!)
            btn .setTitle("", forState: UIControlState.Normal)
        }
        
    }
}

extension AnwerView {
    
    
    /**
     判断是anwerView Btn里面的按钮是否每个都有文字。如果有的话返回yes 如果没有返回NO
     
     - parameter answer: false 证明返回值在用
     
     - returns: 返回值 true 返回证明不在用
     */
    func setAnswerStr(answer:String) -> Bool{
        
        let count = self.subviews.count
        
        for i in 0..<count {
            
            let btn:UIButton = self.subviews[i] as! UIButton
            if (btn.currentTitle == "") {
                
                btn.setTitle(answer, forState: UIControlState.Normal)
                
                if i == count - 1 {
                    
                    // 判断一下对与不对
                    var answerBtn:String = String()
                    for i in 0..<count {
                        
                        let btn = self.subviews[i] as! UIButton
                        answerBtn = answerBtn + btn.currentTitle!
                    }
                    
                    // 如果字体相同
                    if self.answer == answerBtn {
                        
                        NSNotificationCenter.defaultCenter().postNotificationName("next", object: nil)
                        return false
                    }
                }
                
                return false
            }
            
            // 如果文字满了
            if i == count - 1 {
                
              
                
                return true
            }
        }
        return true
    }
    
}

