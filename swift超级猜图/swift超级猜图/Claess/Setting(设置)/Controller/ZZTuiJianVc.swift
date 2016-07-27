//
//  ZZTuiJianVc.swift
//  WangYi2
//
//  Created by WZZ on 16/7/26.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZTuiJianVc: ZZBaseVc {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func getThunb() {
        
        
    }
    
    lazy var more_projects: [ZZProductModel] = {
        
        let path = NSBundle.mainBundle().pathForResource("more_project.json", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        
        var arrDicts: [[String: String]] = [[String: String]]()
        do {
        
            let arr = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            arrDicts = arr as! [[String: String]]
            
        } catch {}
        
        var arrMtbModel: [ZZProductModel] = [ZZProductModel]()
        
        for i in 0..<arrDicts.count {
            
            let dict = arrDicts[i]
            let model = ZZProductModel(dict: dict)
            arrMtbModel.append(model)
        }
        
        
        return arrMtbModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(more_projects)
        
        collectionView.backgroundColor = UIColor.whiteColor()
        //        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "ZZTuiJianView", bundle: nil)
        self.collectionView.registerNib(nib, forCellWithReuseIdentifier: "TuiJianCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ZZTuiJianVc: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return more_projects.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("TuiJianCell", forIndexPath: indexPath) as! ZZTuiJianView
        
        cell.productModel = more_projects[indexPath.row]
        
        return cell
    }
}