//
//  LianXiVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/17.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class LianXiVc: UIViewController {

    // 注销按钮
    lazy var zhuXiaoBtn: UIButton = {
       
        let btn = UIButton(frame: CGRectMake(0, 0, 44, 40), title: "注销", titleColor: UIColor.blueColor(),fontSize: 14)
        btn.addTarget(self, action: "zhuXiaoBtnDidClick", forControlEvents: UIControlEvents.TouchDown)
        btn.backgroundColor = UIColor.orangeColor()
        return btn
    }()
    // 编辑按钮
    lazy var bianJiBtn: UIButton = {
        
        let btn = UIButton(frame: CGRectMake(0, 0, 44, 40), title: "编辑", titleColor: UIColor.blueColor(),fontSize: 14)
        btn.addTarget(self, action: "bianJiBtnDidClick", forControlEvents: UIControlEvents.TouchDown)
        return btn
    }()
    // 添加按钮
    lazy var tianJiaBtn: UIButton = {
        
        let btn = UIButton(frame: CGRectMake(0, 0, 44, 40), title: "添加", titleColor: UIColor.blueColor(),fontSize: 14)
        btn.addTarget(self, action: "tianJiaBtnDidClick", forControlEvents: UIControlEvents.TouchDown)
        return btn
    }()
    // tableView
    lazy var tableView: UITableView = {
       
        let tableView: UITableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "黑马联系人"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: zhuXiaoBtn)
        
        let bianJiItem = UIBarButtonItem(customView: bianJiBtn)
        let tianJiaItem = UIBarButtonItem(customView: tianJiaBtn)
        
        self.navigationItem.rightBarButtonItems = [tianJiaItem,bianJiItem]
        
        
        // 添加TableView
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        
        print("释放成功")
    }

}

// MARK: -ACTION
extension LianXiVc {
    
    func zhuXiaoBtnDidClick() {
        
        // 暂时返回
        let actionVc = UIAlertController(title: "你确定注销吗", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        let sureAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default) { (action: UIAlertAction) -> Void in
            
            actionVc.dismissViewControllerAnimated(true, completion: nil)
            self.navigationController?.popViewControllerAnimated(true)
        }
        
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel) { (action: UIAlertAction) -> Void in
            
            actionVc.dismissViewControllerAnimated(true, completion: nil)
        }
        
        actionVc.addAction(sureAction)
        actionVc.addAction(cancelAction)
        
        self.presentViewController(actionVc, animated: true, completion: nil)
    }
    
    func bianJiBtnDidClick() {
        
        // 编辑
        
    }
    
    func tianJiaBtnDidClick() {
        
        // 添加
        self.navigationController?.pushViewController(AddVc(), animated: true)
    }
}

// MARK: - tableView数据源方法
extension LianXiVc: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("FriendCell")
        if cell == nil {
            
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "FriendCell")
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            
        }
        
        cell?.textLabel?.text = "张三"
        cell?.detailTextLabel?.text = "7758258"
        
        return cell!
    }
}


// MARK: - tableView代理方法
extension LianXiVc: UITableViewDelegate {
    
}

