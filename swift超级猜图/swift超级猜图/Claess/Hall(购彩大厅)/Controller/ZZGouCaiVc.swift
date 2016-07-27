//
//  ZZGouCaiVc.swift
//  WangYi2
//
//  Created by WZZ on 16/7/21.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZGouCaiVc: ZZBaseVc {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    lazy var huoDongBtn: UIButton = {
       
        let btn = UIButton(frame: CGRectMake(0, 0, 63, 36), nomalImage: "CS50_activity_image", heightImage: nil)
        return btn
    }()
    
    lazy var ziXunBtn: UIButton = {
        
        let btn = UIButton(frame: CGRectMake(0, 0, 63, 36), nomalImage: "zixunBarFlat", heightImage: "zixunBarFlatGray")
        btn.setTitle("咨询", forState: UIControlState.Normal)
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: huoDongBtn)

        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: -行为
extension ZZGouCaiVc {
    
    func huoDongBtnDidClicl() {
        
        print("点击了活动")
    }
    
    @IBAction func ziXunBtnClick(sender: UIButton) {
        
        let vc = UITableViewController(style: UITableViewStyle.Plain)
        self.navigationController!.pushViewController(vc, animated: true)
    }
}

extension ZZGouCaiVc : UITableViewDelegate {
    
    
}

extension ZZGouCaiVc : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 30
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if cell == nil {
            
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "str")
        }
        
        cell?.textLabel?.text = String(format: "购彩大厅 *** %ld 房 ***",indexPath.row + 1)
        
        return cell!
    }
}