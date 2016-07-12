//
//  LunBoView.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/11.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class LunBoView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var flow: UICollectionViewFlowLayout!
    
    var imageNames:[String]?
    
    @IBOutlet weak var pageVc: UIPageControl!
    
    weak var timerTool: TimerTool?
    
 
    
    class func lunBoView(frame: CGRect,imageNames:[String]) -> LunBoView {
        
        let lunBoView: LunBoView = NSBundle.mainBundle().loadNibNamed("LunBoView", owner: nil, options: nil).last as! LunBoView
        
        lunBoView.frame = frame
        
        lunBoView.imageNames = imageNames
        
        lunBoView.pageVc.numberOfPages = imageNames.count
        lunBoView.pageVc.currentPage = 0
        
        
        // 设置collectionView属性
        lunBoView.setupCollectionView()
        
        // 异步
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            
            lunBoView.collectionView.contentOffset = CGPointMake(UIScreen.mainScreen().bounds.size.width * 500 * 5, 0)
            lunBoView.timerTool = TimerTool().runSelector(timeInterval: 1, target: lunBoView, selector: "changeImageAnimation", userInfo: nil, repeats: true)
        }
        
        
        return lunBoView
    }
    
    func changeImageAnimation() {
        
        let offerX = self.collectionView.contentOffset.x + self.bounds.size.width
        // 获取当前
        //        self.pageVc.currentPage =  Int(offerX / width) % 5
        self.collectionView.setContentOffset(CGPointMake(offerX, 0), animated: true)
        
    }
    
    func setupCollectionView() {
        
        // 设置flow
        flow.itemSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, self.frame.size.height)
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 0
        flow.scrollDirection = UICollectionViewScrollDirection.Horizontal
        // 设置collectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.pagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        let nib: UINib = UINib(nibName: "LunBoViewCell", bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "cell")
    }
    
    deinit {
        
        print("View已经销毁")
    }
}

extension LunBoView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1000
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell:LunBoViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! LunBoViewCell
        cell.iconView.image = UIImage(named: imageNames![indexPath.row % 5])
        
        return cell
    }
    
    // 拖拽计时器
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
        self.timerTool?.removeTimer()
    }
    
    // 松手重新添加计时器
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        self.timerTool = TimerTool().runSelector(timeInterval: 1, target: self, selector: "changeImageAnimation", userInfo: nil, repeats: true)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        // 获取当前的的位置
        let offerX = self.collectionView.contentOffset.x
        let width = self.frame.size.width
        let number: Int = Int(offerX / width + 0.5) % 5
        pageVc.currentPage = number
    }
    
}
