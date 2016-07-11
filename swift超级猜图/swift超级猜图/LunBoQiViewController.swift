//
//  LunBoQiViewController.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/11.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class LunBoQiViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var flow: UICollectionViewFlowLayout!
    
    weak var timerTool: TimerTool?
    
    var timer: NSTimer?
    
    let imageNames:[String] = ["img_01","img_02","img_03","img_04","img_05"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = UIRectEdge.None
       
        // 设置collectionView属性
        setupCollectionView()
        
       // 异步
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            
            self.collectionView.contentOffset = CGPointMake(UIScreen.mainScreen().bounds.size.width * 500 * 5, 0)
            self.timerTool = TimerTool().runSelector(timeInterval: 1, target: self, selector: "changeImageAnimation", userInfo: nil, repeats: true)
        }
        
        // 添加计时器
//      timer =  NSTimer(timeInterval: 1, target: self, selector: "changeImageAnimation", userInfo: nil, repeats: true)
        
        // 自动加到自动释放池
//        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "changeImageAnimation", userInfo: nil, repeats: true)
        // 添加到线程运行环上，以普通模式
        //NSDefaultRunLoopMode:默认模式：一个时间只能做一个操作
        //NSRunLoopCommonModes：环的形式来执行所有操作
//        NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // 设置collectionView和 flow属性
    func setupCollectionView() {
        
        // 设置flow
        flow.itemSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, 130)
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 0
        flow.scrollDirection = UICollectionViewScrollDirection.Horizontal
        // 设置collectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.pagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        let nib: UINib = UINib(nibName: "LunBoCell", bundle: nil)
        self.collectionView.registerNib(nib, forCellWithReuseIdentifier: "cell")
        
    }
    
    // 
    func changeImageAnimation() {
        
        // 获得当前的set
       let offerX = self.collectionView.contentOffset.x
        //
       self.collectionView.setContentOffset(CGPointMake(offerX + self.view.bounds.size.width, 0), animated: true)
        
    }
    
    deinit {
        
        print("控制器已经销毁")
    }
    
   
}

extension LunBoQiViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1000
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell:LunBoCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! LunBoCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.row % 5])
        
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
    
}

