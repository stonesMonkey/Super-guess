//
//  GroupVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/5.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class GroupVc: UIViewController {
    
    lazy var arr: [String: NSArray] = {
        
        let path:String = NSBundle.mainBundle().pathForResource("product.plist", ofType: nil)!
        let dict = NSDictionary(contentsOfFile: path) as! [String: NSArray]
        
        
        return dict
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
    
    func jieDuan(section: Int) -> NSArray {
        
        var jieDuan: NSArray?
        switch section {
        case 0: // UI基础
            jieDuan = self.arr["UI基础"]
            break
        case 1:
            jieDuan = self.arr["UI进阶"]
            break
        default:
            return [NSArray]()
        }
        return jieDuan!
    }
}

// MARK - 代理 & 数据源
extension GroupVc: UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return arr.count
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let jieDuan = self.jieDuan(section)
        
        
        return jieDuan.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var tableViewCell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell")
        if (tableViewCell == nil) {
            
            tableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        }
        
        let jieDuan = self.jieDuan(indexPath.section)
        
        tableViewCell?.textLabel?.text = jieDuan[indexPath.row] as? String
        
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
            case 10: // 瀑布流
                vc = PuBuLiuVc()
            default:
                return
            }
        } else if (indexPath.section == 1) { // UI进阶
            
            switch indexPath.row {
            case 0:  // 过期
              vc = GuoQiVc()
                break
            case 1:
                vc = ProvenceAndDataVc()
                break
            case 2:
                vc = UserAddressVc()
                break
            default:
                break
            }
        }
        vc.view.backgroundColor = UIColor.whiteColor()
        navigationController!.pushViewController(vc, animated: true)
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if  section == 0 {
            
            return "UI基础"
        } else if section == 1 {
            
            return "UI进阶"
        }
        return ""
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 44
    }
}





