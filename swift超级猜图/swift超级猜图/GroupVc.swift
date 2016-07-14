//
//  GroupVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/5.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class GroupVc: UIViewController {
    
    lazy var arr: [NSArray] = {
        
        let path:String = NSBundle.mainBundle().pathForResource("product.plist", ofType: nil)!
        let arr2 = NSArray(contentsOfFile: path)
        
        return arr2 as! [NSArray];
    }()
    
    lazy var tableView: UITableView = {
        
        var tableView: UITableView = UITableView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Grouped)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view .addSubview(tableView)
    }
}

// MARK - 代理 & 数据源
extension GroupVc: UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return arr.count;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr[section].count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var tableViewCell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell")
        if (tableViewCell == nil) {
            
            tableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        }
        tableViewCell?.textLabel?.text = arr[indexPath.section][indexPath.row] as? String
        
        return tableViewCell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var vc: UIViewController = UIViewController()
        // 如果是第一组
        if(indexPath.section == 0) { // UI基础
            
            switch indexPath.row {
                
            case 0: // 汤姆猫
                 vc = ViewController()
                break
            case 1: // 应用管理
                 vc = YingYongVc()
                break
            case 2: // 超级猜图
                 vc = SuperGuessVc()
                break
            case 3: // 图片放大
                 vc = TuPianFangDaVc()
                break
            case 4: // 轮播器
                 vc = LunBoQiViewController()
                break
            case 5: // 汽车模型
                vc = CarVc()
                break
            case 6: // 团购
                vc = TuanGouVc()
                break
            case 7: // 微博
                vc = WeiBoVc()
                break
            case 8: // QQ好友列表
                vc = QQFriendListVc()
                break
            case 9: // QQ聊天
                vc = QQChatVc()
                break
            default:
                return
            }
        }
        vc.view.backgroundColor = UIColor.whiteColor()
        navigationController!.pushViewController(vc, animated: true)
    }
}





