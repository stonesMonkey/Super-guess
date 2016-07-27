//
//  ZZSettingVc.swift
//  WangYi2
//
//  Created by WZZ on 16/7/23.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZSettingVc: ZZSettingBaseVc {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let duiHuanMaCell = ZZArrowModel(iconName: "RedeemCode", title: "使用兑换码", className: ZZDuiHuanVc.classForCoder())
        
        let gourp1 = ZZGroupItemModel(cells: [duiHuanMaCell], headerTitle: nil, footerTitle: nil)
        
        let tuiSong = ZZArrowModel(iconName: "MorePush", title: "推送提醒", className: ZZTuiSongVc.classForCoder())
        let yaoYiYao = ZZSwitchModel(iconName: "handShake", title: "摇一摇机选")
        let shengYin = ZZSwitchModel(iconName: "handShake", title: "声音效果")
        let goucai = ZZSwitchModel(iconName: "More_LotteryRecommend", title: "购彩")
        
        let gourp2 = ZZGroupItemModel(cells: [tuiSong,yaoYiYao, shengYin, goucai], headerTitle: nil, footerTitle: nil)
        
         let jianCha = ZZArrowModel(iconName: "MoreHelp", title: "检查版本更新", className:nil)
        jianCha.arrowBlock = { [weak self]() -> () in
            
            self!.showTip()
        }
        
         let help = ZZArrowModel(iconName: "MoreUpdate", title: "帮助", className: ZZHelpVc.classForCoder())
        
        let fenXiang = ZZArrowModel(iconName: "MoreShare", title: "分享", className: ZZFenXiangVc.classForCoder())
        let tuiJian = ZZArrowModel(iconName: "MoreNetease", title: "产品推荐", className: ZZTuiJianVc.classForCoder())
        let guanYu = ZZArrowModel(iconName: "MoreAbout", title: "关于", className: ZZGuanYuVc.classForCoder())
        
        let gourp3 = ZZGroupItemModel(cells: [jianCha,help, fenXiang, tuiJian,guanYu], headerTitle: nil, footerTitle: nil)
        
        
        groups!.append(gourp1)
        groups!.append(gourp2)
        groups!.append(gourp3)
    }
    
    func showTip() {
        
        let aleartVc = UIAlertController(title: "结果", message: "当前版本为最新版本", preferredStyle: UIAlertControllerStyle.Alert)
        
        let action = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: { (action:UIAlertAction) -> Void in
            
            
        })
        
        aleartVc.addAction(action)
        
        self.presentViewController(aleartVc, animated: true, completion: nil)
        
        
    }
   
    
}