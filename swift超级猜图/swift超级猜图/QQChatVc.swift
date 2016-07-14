//
//  QQChatVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/14.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class QQChatVc: UIViewController {

    var tableView: UITableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.frame = self.view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.orangeColor()
        view.addSubview(tableView)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

extension QQChatVc: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor.orangeColor()
        return cell
    }
}

extension QQChatVc: UITableViewDelegate {
    
}
