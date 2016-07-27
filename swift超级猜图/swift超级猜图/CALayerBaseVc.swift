//
//  CALayerBaseVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/19.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class CALayerBaseVc: UIViewController {

    lazy var iconView = UIImageView()
    
    lazy var btn = UIButton(type: UIButtonType.Custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        iconView.frame = CGRectMake(100, 100, 100, 100)
//        iconView.backgroundColor = UIColor.orangeColor()
        view.addSubview(iconView)
        
        btn.frame = CGRectMake(200, 200, 100, 100)
        view.addSubview(btn)
        // 一定要btn有颜色图层才会显示
        btn.backgroundColor = UIColor.redColor()
        btn.setImage(UIImage(named: "10ipwf_kqyucz2bkfbg26dwgfjeg5sckzsew_800x800.jpg_200x999"), forState: UIControlState.Normal)
        setBtn()
        setIconView()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setLayer() {
        
        
    }
    
    func setBtn() {
        
        btn.layer.shadowColor = UIColor.orangeColor().CGColor
        btn.layer.shadowRadius = 5
        btn.layer.shadowOffset = CGSizeMake(-10, 10)
        btn.layer.shadowOpacity = 0.5
        
        btn.imageView!.layer.cornerRadius = 20
        btn.imageView!.layer.masksToBounds = true
    }
    
    func setIconView() {
        
        // ImageView不能同时设置阴影和边框如果要用使用其他的办法
        iconView.layer.backgroundColor = UIColor.orangeColor().CGColor
        iconView.layer.borderWidth = 1
        iconView.layer.borderColor = UIColor.blackColor().CGColor
//        iconView.layer.cornerRadius = 5
//        iconView.layer.masksToBounds = true
        
        iconView.layer.shadowColor = UIColor.redColor().CGColor
        iconView.layer.shadowRadius = 10
        // 偏移量
        iconView.layer.shadowOffset = CGSizeMake(-10, 10)
        // 设置透明颜色
        iconView.layer.shadowOpacity = 0.3
    }
}
