//
//  ViewController.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/5.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var imageView: UIImageView = {

        var image = UIImageView()
        image.backgroundColor = UIColor.yellowColor()
        return image
    }()
    lazy var angryBtn: UIButton = UIButton()
    lazy var cymbal: UIButton = UIButton();
    lazy var drink: UIButton = UIButton();
    lazy var eat: UIButton = UIButton();
    lazy var fart: UIButton = UIButton();
    lazy var footLeft: UIButton = UIButton();
    lazy var footRight: UIButton = UIButton();
    lazy var knockout: UIButton = UIButton();
    lazy var pie: UIButton = UIButton();
    lazy var scratch: UIButton = UIButton();
    lazy var stomach: UIButton = UIButton();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubView()
        setupAction()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func animationStar(imageNumber: NSInteger, imageName: String) {
        
        if(imageView.isAnimating()) {
            
            return
        }
        var arr:[UIImage] = [UIImage]()
        for i in 0...imageNumber {
            
            let imageStr = String(format: "%@_%02d.jpg", imageName,i)
            let imagePath:String = NSBundle.mainBundle().pathForResource(imageStr, ofType: nil)!
            let image:UIImage = UIImage(contentsOfFile: imagePath)!
            arr.append(image)
        }
        
        imageView.animationImages = arr
        imageView.animationDuration = (Double(imageNumber) + 1.0) * 0.07;
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
        // 播放完毕释放
        
//        dispatch_after(UInt64((Double(imageNumber) + 1.0) * 0.02), dispatch_get_main_queue(), { () -> Void in
//            
//            self.imageView.stopAnimating()
//            self.animationStop(self.imageView)
//        })
        
       self.performSelector("animationStop:", withObject: self.imageView, afterDelay: (Double(imageNumber) + 1.0) * 0.07)
        
    }
    
    func animationStop(imageView: UIImageView) {
        
        imageView.animationImages = nil;
    }

}

// MARK: - 添加子控件
extension ViewController {
    
    
    func setupSubView() {
        
        
        
        view.addSubview(imageView)
        view.addSubview(angryBtn)
        view.addSubview(cymbal)
        view.addSubview(drink)
        view.addSubview(eat)
        view.addSubview(fart)
        view.addSubview(footLeft)
        view.addSubview(knockout)
        view.addSubview(pie)
        view.addSubview(scratch)
        view.addSubview(stomach)
        
        // 设置属性
        let imageString = NSBundle.mainBundle().pathForResource("angry_00.jpg", ofType: nil)
        imageView.image = UIImage(contentsOfFile: imageString!)
        
        drink.setBackgroundImage(UIImage(named: "drink"), forState: UIControlState.Normal)
        cymbal.setBackgroundImage(UIImage(named: "cymbal"), forState: UIControlState.Normal)
        eat.setBackgroundImage(UIImage(named: "eat"), forState: UIControlState.Normal)
        fart.setBackgroundImage(UIImage(named: "fart"), forState: UIControlState.Normal)
        pie.setBackgroundImage(UIImage(named: "pie"), forState: UIControlState.Normal)
        scratch.setBackgroundImage(UIImage(named: "scratch"), forState: UIControlState.Normal)
        
        // MARK: - 设置约束
        // 图像
        imageView.snp_makeConstraints { (make) -> Void in
            
            make.edges.equalTo(view).inset(UIEdgeInsetsZero)
        }
        
        // 生气按钮
        drink.snp_makeConstraints { (make) -> Void in
            
            make.left.equalTo(view).inset(10)
            make.top.equalTo(view.snp_centerY).inset(-30)
            make.size.equalTo(CGSizeMake(60.0, 60.0))
        }
        
        // 敲锣
        cymbal.snp_makeConstraints { (make) -> Void in
            
            make.left.equalTo(view).inset(10)
            make.top.equalTo(drink.snp_bottom).inset(-30)
            make.size.equalTo(CGSizeMake(60.0, 60.0))
        }
        
        // 吃
        eat.snp_makeConstraints { (make) -> Void in
            
            make.left.equalTo(view).inset(10)
            make.top.equalTo(cymbal.snp_bottom).inset(-30)
            make.size.equalTo(CGSizeMake(60.0, 60.0))
        }
        
        // 放屁
        fart.snp_makeConstraints { (make) -> Void in
            
            make.right.equalTo(view).inset(-10)
            make.top.equalTo(view.snp_centerY).inset(-30)
            make.size.equalTo(CGSizeMake(60.0, 60.0))
        }
        
        // 馅饼
        pie.snp_makeConstraints { (make) -> Void in
            
            make.right.equalTo(view).inset(-10)
            make.top.equalTo(fart.snp_bottom).inset(-30)
            make.size.equalTo(CGSizeMake(60.0, 60.0))
        }
        
        // 划痕
        scratch.snp_makeConstraints { (make) -> Void in
            
            make.right.equalTo(view).inset(-10)
            make.top.equalTo(pie.snp_bottom).inset(-30)
            make.size.equalTo(CGSizeMake(60.0, 60.0))
        }
        
        view.setNeedsUpdateConstraints()
        
    }
    
    func setupAction() {
        
        drink.addTarget(self, action: "drinkDidClick", forControlEvents: UIControlEvents.TouchDown)
        
        cymbal.addTarget(self, action: "cymbalDidClick", forControlEvents: UIControlEvents.TouchDown)
        
        eat.addTarget(self, action: "eatDidClick", forControlEvents: UIControlEvents.TouchDown)
        
        fart.addTarget(self, action: "fartDidClick", forControlEvents: UIControlEvents.TouchDown)
        
        pie.addTarget(self, action: "pieDidClick", forControlEvents: UIControlEvents.TouchDown)
        
        scratch.addTarget(self, action: "scratchDidClick", forControlEvents: UIControlEvents.TouchDown)
        
    }
}

// MARK: - 动画事件
extension ViewController {
    
    func drinkDidClick() {
        
        self.animationStar(80, imageName: "drink")
    }
    
    func cymbalDidClick() {
        
        self.animationStar(12, imageName: "cymbal")
    }
    
    func eatDidClick() {
        
        self.animationStar(39, imageName: "eat")
    }
    
    func fartDidClick() {
        
        self.animationStar(27, imageName: "fart")
    }
    
    func pieDidClick() {
        
        self.animationStar(23, imageName: "pie")
    }
    
    func scratchDidClick() {
        
        self.animationStar(55, imageName: "scratch")
    }
    
    
    
}

















