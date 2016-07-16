//
//  PuBuView.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/15.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class PuBuView: UIView {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var flowLayout: PuBuFlawLayOut!
    
    let colNum: CGFloat = 3
    
    lazy var groups: [PuBuModel]? = {
       
        var groupsNew = [PuBuModel]()
//        for i in 1..<4 {
        
            let str = String(format: "%ld.plist",1)
//            let path = NSBundle.mainBundle().pathForResource(str, ofType: nil)
//            let arrDict = NSArray(contentsOfFile: path!)
            let arrModel = PuBuModel.puBuModel(str)
//        }
        
        return arrModel
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        flowLayout.setGroup(self.groups)
//        flowLayout.minimumLineSpacing = 5
        let padding: CGFloat = (self.collectionView.bounds.size.width - 100 * self.colNum) / (self.colNum + 1)
        flowLayout.minimumInteritemSpacing = padding
        flowLayout.sectionInset = UIEdgeInsetsMake(0, padding, 0, padding)
        flowLayout.delegate = self
        flowLayout.columnCount = 3
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.orangeColor()
        let nib = UINib(nibName: "PuBuCell", bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "PuBuCell")
    }
    

}

// MARK: - dataSouce
extension PuBuView: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.groups!.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: PuBuCell = collectionView.dequeueReusableCellWithReuseIdentifier("PuBuCell", forIndexPath: indexPath) as! PuBuCell
        
//        let modelGroup = self.groups![indexPath.section]
        let model = self.groups![indexPath.row]
        let str = model.icon
        cell.iconView.image = UIImage(named: str!);
        return cell
    }
}

// MARK: - Delegate
extension PuBuView: UICollectionViewDelegate {
    
    
}

extension PuBuView: PuBuFlawLayOutDelegate {
    
    func PuBuFlawLayOutRowHeight(index: Int, width: CGFloat) -> CGFloat {
        
        let model = self.groups![index]
        let height = CGFloat(model.height!.floatValue / model.width!.floatValue) * width
        return height
    }
}
