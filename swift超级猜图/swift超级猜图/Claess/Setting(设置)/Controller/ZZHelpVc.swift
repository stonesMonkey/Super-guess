//
//  ZZHelpVc.swift
//  WangYi2
//
//  Created by WZZ on 16/7/23.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZHelpVc: ZZSettingBaseVc {

    lazy var models: [ZZHelpModel] = {
       
        let path = NSBundle.mainBundle().pathForResource("help.json", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        
        var arrDicts = [[String: AnyObject]]()
        do {
            
            let dicts:[[String: AnyObject]] = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers
                ) as! [[String: AnyObject]]
            
            arrDicts = dicts
        } catch {}
        
        var modelArr = [ZZHelpModel]()
        
        for i in 0..<arrDicts.count {
            
            let model = ZZHelpModel(dict: arrDicts[i])
            modelArr.append(model)
        }
        
        return modelArr
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var cells = [ZZArrowModel]()
        for i in 0..<models.count {
            
            let model = models[i]
            let arrowmodel = ZZArrowModel(iconName: nil, title: model.title, className: nil)
            
            cells.append(arrowmodel)
        }
        
        let group1 = ZZGroupItemModel(cells: cells, headerTitle: nil, footerTitle: nil)
        
        groups?.append(group1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let model = self.models[indexPath.row]
        let vc = ZZHtmlVc()
        vc.model = model
        
        let na = UINavigationController(rootViewController: vc)
        
        let nav = ZZNavVc(rootViewController: vc)
        
        
        self.presentViewController(nav, animated: true, completion: nil)
        
        
    }

}
