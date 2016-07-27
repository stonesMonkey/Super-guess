//
//  ZZTuiJianView.swift
//  WangYi2
//
//  Created by WZZ on 16/7/26.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZTuiJianView: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var productModel: ZZProductModel? {
        
        didSet {
            
            imageView.image = UIImage(named: productModel!.icon!)
            titleLabel.text = productModel!.title!
        }
    }

}
