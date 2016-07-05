//
//  GroupVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/5.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class GroupVc: UIViewController {
    
    lazy var arr: [String] = {
        
        return ["汤姆猫","超级猜图"];
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
        
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var tableViewCell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell")
        if (tableViewCell == nil) {
            
            tableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        }
        tableViewCell?.textLabel?.text = arr[indexPath.row]
        
        return tableViewCell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if(indexPath.row == 0) { // 汤姆猫
            
            let vc = ViewController()
            navigationController?.pushViewController(vc, animated: true)
        } else if (indexPath.row == 1) { // 超级猜图
            
            
        }
    }
    
    
    
    
    
}