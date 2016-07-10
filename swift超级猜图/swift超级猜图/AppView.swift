//
//  AppView.swift
//  One
//
//  Created by WZZ on 16/7/3.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class AppView: UIView {
    
    var appModel:AppModel? {
        
        didSet {
            // 头像视图
            
            iconView.image = UIImage(named: appModel!.imageName!)
            labelText.text = appModel!.appName!
        }
    }
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.setUpUI();
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: 懒加载
    
    private var iconView: UIImageView = UIImageView();
    private var labelText: UILabel = UILabel();
    private let downLoadBtn: UIButton = UIButton();
}


// MARK: -设置界面
extension AppView {
    
    private func setUpUI() {
        
        self.addSubview(iconView)
        self.addSubview(labelText)
        self.addSubview(downLoadBtn)
        // 设置 Label
        labelText.font = UIFont.systemFontOfSize(14);
        labelText.textColor = UIColor.blackColor();
        labelText.textAlignment = NSTextAlignment.Center;
        // 设置Btn
        downLoadBtn.setBackgroundImage(UIImage(named: "buttongreen"), forState: UIControlState.Normal)
        downLoadBtn.setBackgroundImage(UIImage(named: "buttongreen_highlighted"), forState: UIControlState.Highlighted)
        downLoadBtn.setTitle("正在下载", forState: UIControlState.Normal)
        // 自动布局
        iconView.frame = CGRectMake(0, 0, 60, 60);
        labelText.frame = CGRectMake(0, 60, 60, 20);
        downLoadBtn.frame = CGRectMake(0, 80, 60, 20);
    }
}