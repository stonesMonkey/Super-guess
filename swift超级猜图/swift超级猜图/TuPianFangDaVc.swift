//
//  TuPianFangDaVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/11.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class TuPianFangDaVc: UIViewController {
    

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.delegate = self;
        self.scrollView.zoomScale = 2
        self.scrollView.bounces = true
        self.scrollView.showsHorizontalScrollIndicator = true
        self.scrollView.showsVerticalScrollIndicator = true
        self.scrollView.contentSize = CGSizeMake(1600, 1600)
        self.scrollView.maximumZoomScale = 2
        self.scrollView.minimumZoomScale = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TuPianFangDaVc: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) { // 正在滚动时候调用
        
        
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        
        return imageView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        
        print("正在缩放")
    }
    
    
}
