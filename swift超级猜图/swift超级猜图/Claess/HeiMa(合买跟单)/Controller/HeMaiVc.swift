//
//  HeMaiVc.swift
//  WangYi2
//
//  Created by WZZ on 16/7/21.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class HeMaiVc: ZZBaseVc {
    
    var transform: Bool = true
    
    lazy var blueView: UIView = {
       
        let blueView = UIView()
        blueView.backgroundColor = UIColor.blueColor()
        blueView.frame = CGRectMake(0,-150,screenW, 150)
        return blueView
    }()
    
    @IBOutlet weak var heMaiBtn: UIButton!
    
    
    @IBAction func HeMaiBtnDidClick(sender: UIButton) {
        
        view.addSubview(blueView)
        
        transFormbtn()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let angle: CGFloat = CGFloat(M_PI) / 2
        self.heMaiBtn.imageView?.transform = CGAffineTransformMakeRotation(-angle)
    }
    
    func transFormbtn() {
        
        transform = !transform
        if transform {
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                
                let angle: CGFloat = CGFloat(M_PI) / 2
                self.heMaiBtn.imageView?.transform = CGAffineTransformMakeRotation(-angle)
                self.blueView.frame = CGRectMake(0,-150,screenW, 150)
            })
            
        } else {
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                
                self.heMaiBtn.imageView?.transform = CGAffineTransformIdentity
                self.blueView.frame = CGRectMake(0,0,screenW, 150)
            })
            
        }
    }
}
