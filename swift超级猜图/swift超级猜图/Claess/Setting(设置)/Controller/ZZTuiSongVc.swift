//
//  ZZTuiSongVc.swift
//  WangYi2
//
//  Created by WZZ on 16/7/23.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZTuiSongVc: ZZSettingBaseVc {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let kaiJiang = ZZArrowModel(iconName: nil, title: "开奖推送", className: nil)
        let biFen = ZZArrowModel(iconName: nil, title: "比分直播", className: ZZBiFenZhiBoVc.classForCoder())
        let kaiJiang2 = ZZArrowModel(iconName: nil, title: "开奖推送", className: nil)
        let kaiJiang3 = ZZArrowModel(iconName: nil, title: "开奖推送", className: nil)
        let kaiJiang4 = ZZArrowModel(iconName: nil, title: "开奖推送", className: nil)
        
        let group = ZZGroupItemModel(cells: [kaiJiang,biFen,kaiJiang2,kaiJiang3,kaiJiang4], headerTitle: nil, footerTitle: nil)
        groups?.append(group)
    }
}
