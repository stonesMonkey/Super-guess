//
//  TGFootView.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/12.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

protocol TGFootViewDelegate: NSObjectProtocol {
    
    func tgFootViewBtnDidClick(footerView:TGFootView)
}

class TGFootView: UIView {

    
    @IBOutlet weak var loadBtn: UIButton!

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var activey: UIActivityIndicatorView!
    
    weak var delegate:TGFootViewDelegate?
    
    var sucess: Void -> () = {
        () in
        
    }
}

extension TGFootView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
        
    }
    
    class func tgFootView() -> TGFootView {
        
        let footView:TGFootView = NSBundle.mainBundle().loadNibNamed("TGFootView", owner: nil, options: nil).last as! TGFootView
        footView.titleLabel.hidden = true
        footView.activey.hidden = true
        
        return footView;
    }
    
    func completer() {
        
        sucess()
    }
    @IBAction func btnDidClick(sender: UIButton) {
        
        if delegate != nil {
            
            self.delegate!.tgFootViewBtnDidClick(self)
            self.activey.hidden = false
            self.titleLabel.hidden = false
            self.activey.startAnimating()
            loadBtn.hidden = true
            
            performSelector("completer", withObject: nil, afterDelay: 1)
        }
        
    }
    
    
}