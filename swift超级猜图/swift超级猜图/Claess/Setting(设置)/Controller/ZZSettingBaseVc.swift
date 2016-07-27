//
//  ZZSettingVc.swift
//  WangYi2
//
//  Created by WZZ on 16/7/23.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

enum ItemType {
    
    case arrow
    case on_off
    case label
}

class ZZSettingBaseVc: ZZBaseVc {
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var groups: [ZZGroupItemModel]?
    
    // MARK - View Life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = UIRectEdge.None
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        view.addSubview(tableView)
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 15
        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        tableView.contentInset = UIEdgeInsetsMake(-15, 0, 0, 0)
        
        groups = [ZZGroupItemModel]()
    }
}

// 代理方法
extension ZZSettingBaseVc: UITableViewDelegate {
    
    
}

// 数据源方法
extension ZZSettingBaseVc: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return self.groups!.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let group = self.groups![section] as ZZGroupItemModel
        return group.cells!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let group = self.groups![indexPath.section]
        
        let cellModel = group.cells![indexPath.row] as! ZZBaseCellModel
        
        let itemType = itemStype(cellModel)
        
        // 线要隐藏
        var isLast = false
        
        if group.cells!.count - 1 == indexPath.row {
            
            isLast = true
        }
        
        switch (itemType) {
        case .arrow: // 如果是箭头的label
            
            let cell = ZZArrowCell.arrowCell(tableView, reuseIdentifier: "arrowCell")
            cell.arrowModel = cellModel as? ZZArrowModel
            cell.lineView.hidden = isLast
            return cell
        case .on_off: // 如果是开关Label
            
            let cell = ZZSwitchCell.switchCell(tableView, reuseIdentifier: "switchCell")
            cell.switchModel = cellModel as? ZZSwitchModel
            cell.lineView.hidden = isLast
            
            return cell
            
        case .label:
            
            let cell = ZZLabelCell.labelCell(tableView,reuseIdentifier: "labelCell")
            cell.titleLabelModel = cellModel as? ZZTitleLabelModel
            cell.lineView.hidden = isLast
            return cell
        }
        
    }
    
    func itemStype(model: AnyObject) -> ItemType {
        
        if model.isKindOfClass(ZZArrowModel) { // 如果是箭头的cell
            
            return ItemType.arrow
        } else if model.isKindOfClass(ZZSwitchModel) { // 如果是开关cell
            
            return ItemType.on_off
        } else {
            
            return ItemType.label
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let group = self.groups![indexPath.section]
        let cellModel = group.cells![indexPath.row] as! ZZBaseCellModel
        let itemType = itemStype(cellModel)
        
        switch (itemType) {
        case .arrow:  // 如果是箭头的label
            
            let model = cellModel as! ZZArrowModel
            
            if model.arrowBlock != nil {
                
                model.arrowBlock!()
            }
            
            if model.className != nil {
                // 拿到类名要加type才是那个类
                let classVc = model.className as! ZZBaseVc.Type
                let vc = classVc.init()
                vc.view.backgroundColor = UIColor.whiteColor()
                //            let vc = model.className..init() as! ZZBaseVc.type
                vc.view.backgroundColor = UIColor.orangeColor()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            break
        case .on_off:  // 如果是开关Label
            
            break
        case .label:
            
            // 如果block != nil
            let model = cellModel as! ZZTitleLabelModel
            if model.block != nil {
                
                model.block!()
                return
            }
            
            break
        }
        
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        let group = groups![section]
        
        return group.footerTitle
    }
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let group = groups![section]
        
        return group.sectionHeadTitle
    }
}

