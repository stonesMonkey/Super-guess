
//
//  SuperGuess.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/8.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit
/**
 总结： 1、如果要做动画，约束就不要使用框架
*/
class SuperGuessVc: UIViewController {
    
    // 背景图片
    lazy var bgImageView = UIImageView(image: UIImage(named: "bj"))
    // 金币按钮
    lazy var goldBtn = UIButton(title: "1000", image: "coin", state: UIControlState.Normal)
    // 关卡文本
    lazy var guanQiaNumber = UILabel(title: "1/10", fontSize: 14.0, alighment: NSTextAlignment.Center, color: UIColor.whiteColor())
    // 提示文本
    lazy var tipLabel = UILabel(title: "测试测试测试", fontSize: 14.0, alighment: NSTextAlignment.Center, color: UIColor.whiteColor())
    // 提示按钮
    lazy var tipBtn = UIButton(title: "提示", normalImage: "btn_left", hightImage: "btn_left_highlighted",fontSize: 18)
    // 帮助按钮
    lazy var helpBtn = UIButton(title: "帮助", normalImage: "btn_left", hightImage: "btn_left_highlighted",fontSize: 18)
    // 大图按钮
    lazy var bigBtn = UIButton(title: "大图", normalImage: "btn_right", hightImage: "btn_right_highlighted",fontSize: 18)
    // 下一关按钮
    lazy var nextBtn = UIButton(title: "下一关", normalImage: "btn_right", hightImage: "btn_right_highlighted",fontSize: 18.0)
    // 图像按钮
    lazy var iconBtn = UIButton(imageName: "movie_jf", imageEdgeInsets: UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0))
    // 答案区
    lazy var answerView = AnwerView(frame: CGRectZero)
    // 选择区
    lazy var questionView = QuestionView(frame: CGRectZero)
    
    // 数据
    lazy var models:[QuestionModel] = QuestionModel.questionModels()
    
    // 关卡数
    var i:Int = 0
    
    lazy var mengBanView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubView()
        setupConstraints()
        
        self.registerNotifation()
        // 通知
        nextGuan(0)
    }
    
    
    func registerNotifation() {
        
        // 当按钮全部相同的时候
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "nextGuanNotification", name: "next", object: nil)
    }
    
    // 下一关
    func nextGuan(addNumber: Int) {
        
        let result = i + addNumber
        if result < models.count {
            
            self.i = result
            let model = models[i]
            answerView.setupSubView(model.answerWord)
            questionView.setupSubView(model.options!)
            tipLabel.text = model.title
            iconBtn.setImage(UIImage(named: model.icon!), forState: UIControlState.Normal)
            guanQiaNumber.text = String(format: "%d / %d",self.i + 1, models.count)
        } else {
            
            self.showTipWindow("当前是最后一关", message: "点击取消/确定", preferredStyle: UIAlertControllerStyle.Alert)
        }
    }
    
    // 显示大图
    func showBigImage() {
        
//        self.mengBanView.frame = self.view.frame
//        self.mengBanView.backgroundColor = UIColor.blackColor()
//
//        self.view.addSubview(mengBanView)
//        
//        self.view.bringSubviewToFront(iconBtn)
//        
//        
//        UIView.animateWithDuration(0.5, animations: { () -> Void in
////
//            self.iconBtn.snp_updateConstraints(closure: { (make) -> Void in
//                
//                make.center.equalTo(self.view)
//                make.size.equalTo(CGSizeMake(self.view.bounds.width, self.view.bounds.width))
//            })
//            
//        }, completion: { (bool: Bool) -> Void in
////
////            
//        })
       
        
        
    }
}

// MARK: - 添加子控件 & 属性添加
extension SuperGuessVc {
    
    func setupSubView() {
        
        // 背景图片
        view.addSubview(bgImageView)
        // 金币按钮
        view.addSubview(goldBtn)
        // 提示文本
        view.addSubview(tipLabel)
        
        // 关卡文本
        view.addSubview(guanQiaNumber)
        // 提示按钮
        view.addSubview(tipBtn)
        // 帮助按钮
        view.addSubview(helpBtn)
        // 大图按钮
        view.addSubview(bigBtn)
        bigBtn.addTarget(self, action: "showBigImage", forControlEvents: UIControlEvents.TouchDown)
        // 下一个按钮
        view.addSubview(nextBtn)
        
        self.nextBtn.addTarget(self, action: "nextBtnDidClick:", forControlEvents: UIControlEvents.TouchDown)
        //
        view.addSubview(answerView)
        answerView.delegate = self
        //
        view.addSubview(questionView)
        questionView.delegate = self
    
        
        // 文本
        view.addSubview(iconBtn)
    }
    
    // 设置属性约束
    func setupConstraints() {
        
        // 背景图片
        bgImageView.snp_makeConstraints { (make) -> Void in
            
            make.edges.equalTo(self.view).offset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
        // 金币按钮
        goldBtn.snp_makeConstraints { (make) -> Void in
            
            make.right.equalTo(self.view.snp_right).offset(0)
            make.top.equalTo(self.view.snp_top).offset(66)
            make.size.equalTo(CGSizeMake(80, 30))
        }
        
        // 关卡文本
        guanQiaNumber.snp_makeConstraints { (make) -> Void in
            
            make.left.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
            make.top.equalTo(self.view).offset(80)
        }
        
        //  提示文本
        tipLabel.snp_makeConstraints { (make) -> Void in
            
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view)
            make.top.equalTo(guanQiaNumber.snp_bottom).offset(5)
        }
        
        // icon图片
        iconBtn.snp_makeConstraints { (make) -> Void in
            
            make.centerX.equalTo(view)
            make.top.equalTo(guanQiaNumber.snp_bottom).offset(30)
            make.size.equalTo(CGSizeMake(150, 150))
        }
        
        // 提示按钮
        tipBtn.snp_makeConstraints { (make) -> Void in
            
            make.left.equalTo(view)
            make.top.equalTo(iconBtn.snp_top).offset(15)
            make.size.equalTo(CGSizeMake(71, 36))
        }
        
        // 帮助按钮
        helpBtn.snp_makeConstraints { (make) -> Void in
            
            make.left.equalTo(view)
            make.bottom.equalTo(iconBtn.snp_bottom).offset(-15)
            make.size.equalTo(CGSizeMake(71, 36))
        }
        
        // 大图按钮
        bigBtn.snp_makeConstraints { (make) -> Void in
            
            make.right.equalTo(view)
            make.top.equalTo(iconBtn.snp_top).offset(15)
            make.size.equalTo(CGSizeMake(71, 36))
        }
        
        // 下一关按钮
        nextBtn.snp_makeConstraints { (make) -> Void in
            
            make.right.equalTo(view)
            make.bottom.equalTo(iconBtn.snp_bottom).offset(-15)
            make.size.equalTo(CGSizeMake(71, 36))
        }
        
        answerView.backgroundColor = UIColor.blueColor()
        answerView.snp_makeConstraints { (make) -> Void in
            
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.top.equalTo(iconBtn.snp_bottom).offset(10)
            make.height.equalTo(44)
        }
        
        questionView.backgroundColor = UIColor.orangeColor()
        questionView.snp_makeConstraints { (make) -> Void in
            
            make.top.equalTo(answerView.snp_bottom).offset(10)
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.height.equalTo(206)
        }
        
        view.setNeedsUpdateConstraints()
    }
    
}

// MARK: - action
extension SuperGuessVc {
    
    func nextBtnDidClick(btn:UIButton) {
        
        self.nextGuan(1)
    }
}

// MARK - show
extension SuperGuessVc {
    
    func showTipWindow(title: String, message: String, preferredStyle: UIAlertControllerStyle) {
        
        let alertVc = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        let sureAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default) { (action: UIAlertAction) -> Void in
            
            alertVc.dismissViewControllerAnimated(false, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Default) { (action: UIAlertAction) -> Void in
            
            alertVc.dismissViewControllerAnimated(false, completion: nil)
        }
        alertVc .addAction(sureAction)
        alertVc .addAction(cancelAction)
        self.presentViewController(alertVc, animated: true) { () -> Void in
            
            
        }
    }
}

// MARK: - notificetionSelector
extension SuperGuessVc {
    
    func nextGuanNotification() {
        
        self.nextGuan(1)
    }
}

// MARK -- delegate
extension SuperGuessVc:AnwerViewDelegate, QuestionViewDelegate {
    
    func AnwerViewBtnDidClick(str: String) {
        
        self.questionView.getString(str)
    }
    
    //
    func QuestionViewBtnDidClick(str: String) -> Bool {
        
        return self.answerView.setAnswerStr(str)
    }
}




// MARK: - delegate
//class SuperGuessVc:AnwerViewDelegate {
//    
//}
