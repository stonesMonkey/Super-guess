//
//  TuanGouVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/11.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class TuanGouVc: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var tgModel:[TGModel] = {
        
        return TGModel.tgModels()
    }()
    
    deinit {
        
        print("销毁")
    }
    
    
    lazy var lunboView:LunBoView = {
        
        let lunboView = LunBoView.lunBoView(CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 130),imageNames: self.imageNames)
        lunboView.backgroundColor = UIColor.orangeColor()
        
        return lunboView
    }()
    
    let imageNames:[String] = ["img_01","img_02","img_03","img_04","img_05"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.automaticallyAdjustsScrollViewInsets = false
        self.edgesForExtendedLayout = UIRectEdge.None
        
        let nib = UINib(nibName: "TuanGouCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "tgCell")
    }
    
    // WARN: - 为什么！！！！
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
//        self.tableView.rowHeight = 80
        self.tableView.tableHeaderView = self.lunboView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // 尾部View
        let footerView = TGFootView.tgFootView()
        footerView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 44)
        footerView.delegate = self
        weak var weakSelf = self
        footerView.sucess = {
            () in
            footerView.loadBtn.hidden = false
            footerView.activey.hidden = true
            footerView.titleLabel.hidden = true
            weakSelf!.tableView.reloadData()
            
            weakSelf!.tableView .setContentOffset(CGPointMake(0, (weakSelf?.tableView.contentSize.height)! - self.tableView.frame.size.height), animated: true)
        }
        self.tableView.tableFooterView = footerView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }
    
}

// MARK: - dataSouce Delegate
extension TuanGouVc:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.tgModel.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tgCell") as! TuanGouCell
        cell.setTgModel(self.tgModel[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return 80
        }
}

// MARK: - TGFootViewDelegate
extension TuanGouVc: TGFootViewDelegate {
    
    func tgFootViewBtnDidClick(footerView: TGFootView) {
        
        let model:TGModel = TGModel()
        model.buyCount = "1000"
        model.icon = "9b437cdfb3e3b542b5917ce2e9a74890"
        model.price = "998"
        model.title = "志忠烤鱼"
        
        self.tgModel.append(model)
    }
}
