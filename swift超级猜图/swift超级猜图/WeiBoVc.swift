//
//  WeiBoVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/12.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class WeiBoVc: UITableViewController {

    lazy var cellFrames = CellFrame.weiBoCellFrame(WeiBoModel.models())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

extension WeiBoVc {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.cellFrames.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = WeiBoCell.cell(tableView, reuseIdentifier: "weiBoCell")
        
        cell.cellFrame = self.cellFrames[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return cellFrames[indexPath.row].cellHeight!
//        return 300
    }
}