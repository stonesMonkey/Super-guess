//
//  GestureVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/19.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class GestureVc: UIViewController {
    
    var hidenNavBar: Bool = false
    
    lazy var imageView: UIImageView = {
        
        let iconView = UIImageView(image: UIImage(named: "1"))
        iconView.frame = CGRectMake(100, 100, 100, 100)
        iconView.userInteractionEnabled = true
        // 添加单击手势
        let tap = UITapGestureRecognizer(target: self, action: "tapGestureAction")
//        iconView.addGestureRecognizer(tap)
        
        // 长按手势
        let long = UILongPressGestureRecognizer(target: self, action: "longGestureAction:")
//        iconView.addGestureRecognizer(long)
        
        // 拖拽手势
        let pan = UIPanGestureRecognizer(target: self, action: "panGestureAction:")
        iconView.addGestureRecognizer(pan)
        
        // 清扫手势
        let rightSwip = UISwipeGestureRecognizer(target: self, action: "swipGestureAction:")
        rightSwip.direction = UISwipeGestureRecognizerDirection.Right
        iconView.addGestureRecognizer(rightSwip)
        
        let leftSwip = UISwipeGestureRecognizer(target: self, action: "swipGestureAction:")
        leftSwip.direction = UISwipeGestureRecognizerDirection.Left
        iconView.addGestureRecognizer(leftSwip)
        // pan手势识别想要成功必须在swip手势识别之后
        pan.requireGestureRecognizerToFail(rightSwip)
        pan.requireGestureRecognizerToFail(leftSwip)
        
        // 捏合手势
        let pinGesture = UIPinchGestureRecognizer(target: self, action: "pinGestureAction:")
        pinGesture.scale = 0.5
        iconView.addGestureRecognizer(pinGesture)
        
        let rotation = UIRotationGestureRecognizer(target: self, action: "")
        iconView.addGestureRecognizer(rotation)
        
        // 旋转手势
        return iconView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "技术指导老师"
        
        // 隐藏导航栏放在这个方法是没有用的 因为在这里navigationVc还是nil
        //        self.navigationController?.setNavigationBarHidden(true, animated: true)
        //        self.navigationController?.setToolbarHidden(true, animated: true)
        
        
        view.addSubview(imageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    func show() {
        
        let alertVc = UIAlertController(title: "点击取消", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        let sureAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction) -> Void in
            
            alertVc.dismissViewControllerAnimated(true, completion: nil)
        })
        
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction) -> Void in
            
            alertVc.dismissViewControllerAnimated(true, completion: nil)
        })
        
        alertVc.addAction(sureAction)
        alertVc.addAction(cancelAction)
        
        self.presentViewController(alertVc, animated: true, completion: nil)
    }
}

extension GestureVc {
    
    // 手势方法
    func tapGestureAction() {
        
        self.hidenNavBar = !self.hidenNavBar
        self.navigationController?.setNavigationBarHidden(self.hidenNavBar, animated: true)
//        self.navigationController?.setToolbarHidden(self.hidenNavBar, animated: true)
    }
    
    func longGestureAction(longGesture: UILongPressGestureRecognizer) {
        
        
        if longGesture.state == UIGestureRecognizerState.Began {
            
           print("longGesture开始的到时候触发")
        } else if longGesture.state == UIGestureRecognizerState.Changed {
            
            print("longGesture改变的到时候触发 && 移动的时候也会触发")
        } else if longGesture.state == UIGestureRecognizerState.Cancelled {
            
            print("longGesture取消的时候触发")
        } else if longGesture.state == UIGestureRecognizerState.Ended {
            
            print("longGesture结束的时候触发")
        } else if longGesture.state == UIGestureRecognizerState.Failed {
            
            print("longGesture错误的时候触发")
        } else if longGesture.state == UIGestureRecognizerState.Possible {
            
            print("longGesture潜在的情况下触发")
        }
    }
    
    func panGestureAction(panGesture: UIPanGestureRecognizer) {
        
        if panGesture.state == UIGestureRecognizerState.Began {
            
            print("panGesture开始的到时候触发")
        } else if panGesture.state == UIGestureRecognizerState.Changed {
            
            print("panGesture改变的到时候触发 && 移动的时候也会触发")
        } else if panGesture.state == UIGestureRecognizerState.Cancelled {
            
            print("panGesture取消的时候触发")
        } else if panGesture.state == UIGestureRecognizerState.Ended {
            
            print("panGesture结束的时候触发")
        } else if panGesture.state == UIGestureRecognizerState.Failed {
            
            print("panGesture错误的时候触发")
        } else if panGesture.state == UIGestureRecognizerState.Possible {
            
            print("panGesture潜在的情况下触发")
        }
    }
    
    func swipGestureAction(swipGesture: UISwipeGestureRecognizer) {
        
        if swipGesture.state == UIGestureRecognizerState.Began {
            
            print("swipGesture开始的到时候触发")
        } else if swipGesture.state == UIGestureRecognizerState.Changed {
            
            print("panGesture改变的到时候触发 && 移动的时候也会触发")
        } else if swipGesture.state == UIGestureRecognizerState.Cancelled {
            
            print("swipGesture取消的时候触发")
        } else if swipGesture.state == UIGestureRecognizerState.Ended {
            
            print("swipGesture结束的时候触发")
        } else if swipGesture.state == UIGestureRecognizerState.Failed {
            
            print("swipGesture错误的时候触发")
        } else if swipGesture.state == UIGestureRecognizerState.Possible {
            
            print("swipGesture潜在的情况下触发")
        }
    }
    
    func pinGestureAction(pinGesture: UIPinchGestureRecognizer) {
        
        if pinGesture.state == UIGestureRecognizerState.Began {
            
            print("pinGesture开始的到时候触发")
        } else if pinGesture.state == UIGestureRecognizerState.Changed {
            
            print("pinGesture改变的到时候触发 && 移动的时候也会触发")
        } else if pinGesture.state == UIGestureRecognizerState.Cancelled {
            
            print("pinGesture取消的时候触发")
        } else if pinGesture.state == UIGestureRecognizerState.Ended {
            
            print("pinGesture结束的时候触发")
        } else if pinGesture.state == UIGestureRecognizerState.Failed {
            
            print("pinGesture错误的时候触发")
        } else if pinGesture.state == UIGestureRecognizerState.Possible {
            
            print("pinGesture潜在的情况下触发")
        }
    }
    
    func rotationGestureAction(rotation: UIRotationGestureRecognizer) {
        
        if rotation.state == UIGestureRecognizerState.Began {
            
            print("rotation开始的到时候触发")
        } else if rotation.state == UIGestureRecognizerState.Changed {
            
            print("rotation改变的到时候触发 && 移动的时候也会触发")
        } else if rotation.state == UIGestureRecognizerState.Cancelled {
            
            print("rotation取消的时候触发")
        } else if rotation.state == UIGestureRecognizerState.Ended {
            
            print("rotation结束的时候触发")
        } else if rotation.state == UIGestureRecognizerState.Failed {
            
            print("rotation错误的时候触发")
        } else if rotation.state == UIGestureRecognizerState.Possible {
            
            print("rotation潜在的情况下触发")
        }
    }
}