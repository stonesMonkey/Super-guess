//
//  QuestionView.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/9.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

protocol QuestionViewDelegate: NSObjectProtocol {
    
    func QuestionViewBtnDidClick(str: String) -> Bool
}

class QuestionView: UIView {
    
    
    weak var delegate: QuestionViewDelegate?
    var options:[String]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    convenience init(model:QuestionModel) {
        
        self.init(frame:CGRectZero)
        
        setupSubView(model.options!)
        self.options = model.options
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getString(str:String) {
        
        for i in 0..<options!.count {
            
            if str == options![i] { // 如果字母相同
                
                let btn: UIButton = self.subviews[i] as! UIButton
                btn.hidden = false
            }
        }
    }
}


extension QuestionView {
    
    func setupSubView(questionWord:[String]) {
        
        // 记录所有按钮的字符串
        self.options = questionWord
        
        // 添加子控件

        for _ in 0..<subviews.count {
            
            self.subviews[0].removeFromSuperview()
        }
        let appding:CGFloat = (UIScreen.mainScreen().bounds.size.width - 7.0 * 44.0) / 8.0
        let width: CGFloat = 44
        let height: CGFloat = 44
        let count:Int = questionWord.count 

        for i  in 0..<count {
            
            let subView = UIButton()
            subView.setTitle(questionWord[i], forState: UIControlState.Normal)
            
            let subViewX: CGFloat = CGFloat(i % 7) * (appding + width) + appding
            let subViewY: CGFloat = CGFloat(i / 7) * (appding + width)
            print(i % count)
            print(i / count)
            subView.frame = CGRectMake(subViewX, subViewY, width, height)
            
            subView.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            subView.backgroundColor = UIColor.whiteColor()
            subView.addTarget(self, action:"btnDidClick:" , forControlEvents: UIControlEvents.TouchDown)
            subView.setTitle("", forState: UIControlState.Selected)
            self.addSubview(subView)
        }
    }
    
    func btnDidClick(btn: UIButton) {
        
        if self.delegate != nil {
            
           btn.hidden = !self.delegate!.QuestionViewBtnDidClick(btn.currentTitle!)
        }
    }
    
}