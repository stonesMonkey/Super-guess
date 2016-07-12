//
//  CarVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/11.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class CarVc: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    lazy var carGroup:[CarGroup] = {
       
        let carGroup: [CarGroup] = CarGroup.carGroups()
        
        return carGroup
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

extension CarVc: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return carGroup.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let carGroupModel:CarGroup = carGroup[section]
        return (carGroupModel.carModels?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if cell == nil {
            
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        }
        let carGroup = self.carGroup[indexPath.section]

        let car = carGroup.carModels![indexPath.row]
        cell?.textLabel?.text = car.name
        cell?.imageView?.image = UIImage(named: car.icon!)
        return cell!
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let carGroup = self.carGroup[section]
        
        return carGroup.title
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        
        var mtbArr = [String]()
        
        for i in 0..<carGroup.count {
            
            let carModel = carGroup[i]
            mtbArr.append(carModel.title!)
        }
        
        return mtbArr
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // 获取点击的那个cell的数据
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        showAleat(cell!)
    }
    
}

extension CarVc {
    
    func showAleat(currentCell:UITableViewCell) {
        
        let alertVc = UIAlertController(title: "修改汽车名字", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        
        let actionSure: UIAlertAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default,handler:{(action:UIAlertAction) -> Void in
            
            let textFiled = alertVc.textFields![0]
            self.view.endEditing(true)
            currentCell.textLabel?.text = textFiled.text
            alertVc.dismissViewControllerAnimated(true, completion: nil)
            
        })
        
        
        let actionCancel: UIAlertAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: { (action: UIAlertAction) -> Void in
            
            self.view.endEditing(true)
            alertVc.dismissViewControllerAnimated(true, completion: nil)
        })
        alertVc.addAction(actionSure)
        alertVc.addAction(actionCancel)
        alertVc.addTextFieldWithConfigurationHandler { (textFiled:UITextField) -> Void in
            
            textFiled.text = currentCell.textLabel?.text
        }
        self.presentViewController(alertVc, animated: true, completion: nil)
    }
}
