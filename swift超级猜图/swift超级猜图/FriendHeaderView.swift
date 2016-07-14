//
//  FriendHeaderView.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/14.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit


protocol FriendHeaderViewDelegate: NSObjectProtocol {
    
    func friendHeaderViewDidClick(headerView: FriendHeaderView)
}

class FriendHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var arrowImage: UIImageView!
    
    @IBOutlet weak var sectionNameLabel: UILabel!
    
    @IBOutlet weak var onLineLabel: UILabel!
    
    weak var delegate: FriendHeaderViewDelegate?
    
//    var open: Bool = false
    
    var friendGroup: FriendGroup? {
        
        didSet {
            
            arrowImage.image = UIImage(named: "buddy_header_arrow")
            sectionNameLabel.text = friendGroup?.name
            onLineLabel.text = String(format: "在线人数 %@ / %ld",(friendGroup?.online)!,friendGroup!.friends!.count)
    
        }
    }
    
    
    @IBAction func btnDidClick(sender: UIButton) {
        
        
      
        friendGroup!.open = !friendGroup!.open
        if  delegate != nil {
            
            self.delegate?.friendHeaderViewDidClick(self)
        }
    }
    
    func transForm() {
        
        var transForm: CGAffineTransform = CGAffineTransformIdentity
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            
            if  self.friendGroup!.open == true {
                transForm = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
            } else {
                
                transForm = CGAffineTransformIdentity
            }
            
            
            UIView.animateWithDuration(0.2) { () -> Void in
                
                self.arrowImage.transform = transForm
            }
            
        }
    }
    
    
    
    

}
