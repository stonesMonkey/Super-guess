//
//  CALayerVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/19.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class CALayerVc: UITableViewController {
    

    lazy var layerModel: [String]? = {
       
        return ["Cayler的基本使用","图层旋转"]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "reuseIdentifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.layerModel!.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        cell.textLabel?.text = self.layerModel![indexPath.row]

        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 0 {
            
            let vc = CALayerBaseVc()
            vc.view.backgroundColor = UIColor.whiteColor()
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 1 { // 图层旋转
            
            let vc = LayerTransFormVc()
            vc.view.backgroundColor = UIColor.whiteColor()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
