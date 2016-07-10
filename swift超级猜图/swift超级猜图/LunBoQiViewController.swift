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
    
    
    let imageNames:[String] = ["img_01","img_02","img_03","img_04","img_05"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = UIRectEdge.None
        // 设置flow
        flow.itemSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, 130)
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 0
        flow.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.pagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        let nib: UINib = UINib(nibName: "LunBoCell", bundle: nil)
        self.collectionView.registerNib(nib, forCellWithReuseIdentifier: "cell")
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            
            self.collectionView.contentOffset = CGPointMake(UIScreen.mainScreen().bounds.size.width * 500 * 5, 0)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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
    
    
}