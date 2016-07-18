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
    
    // 联系人
    lazy var allModel: [UserFriendModel] = {
        
        // 归档中获取
        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.UserDomainMask, true).last?.stringByAppendingString("friendContact.data")
        
        let contact = NSKeyedUnarchiver.unarchiveObjectWithFile(path!)
        
        if contact != nil {
            
            return contact as! [UserFriendModel]
        }
       
        return [UserFriendModel]()
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
        
    }
    
    func saveUserMessage() {
        
         let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.UserDomainMask, true).last?.stringByAppendingString("friendContact.data")
        NSKeyedArchiver.archiveRootObject(self.allModel, toFile: path!)
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
        
        let addVc = AddVc()
        addVc.delegate = self
        // 添加
        self.navigationController?.pushViewController(addVc, animated: true)
    }
}

// MARK: - tableView数据源方法
extension LianXiVc: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.allModel.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("FriendCell")
        if cell == nil {
            
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "FriendCell")
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
            cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            
        }
        
        let model = self.allModel[indexPath.row]
        cell?.textLabel?.text = model.name as? String
        cell?.detailTextLabel?.text = model.phone as? String
        
        return cell!
    }
}


// MARK: - tableView代理方法
extension LianXiVc: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let model = self.allModel[indexPath.row]
        let bianJiVc = BianJiVc()
        bianJiVc.model = model
        bianJiVc.delegate = self
        self.navigationController?.pushViewController(bianJiVc, animated: true)
    }
}

// MARK: - 添加用户代理方法
extension LianXiVc: AddVcDelegate {
    
    func AddVcAddBtnDidClick(addVc: AddVc, model: UserFriendModel) {
        
        self.allModel.append(model)
        
        let indexPath = Utils.indexPathFor(self.allModel.count - 1, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
        
        // 保存文件
        saveUserMessage()
    }
}

// MARK: - 编辑联系人代理方法
extension LianXiVc: BianJiVcDelegate {
    
    func BianJiVcSaveBtnDidClick(bianji: BianJiVc, model: UserFriendModel) {
      
        //
        let index = self.allModel.indexOf(model)
        
        let indexPath = Utils.indexPathFor(index!, inSection: 0)
        // 保存文件
        saveUserMessage()
        //
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
    }
    
    
}


