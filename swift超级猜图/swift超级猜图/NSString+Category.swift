//
//  NSString+Category.swift
//  
//
//  Created by WZZ on 16/7/12.
//
//

import Foundation
import UIKit

extension NSString {
    
    func strBoundingRectWithSize(options: NSStringDrawingOptions, context: NSStringDrawingContext? ) -> CGSize {
        
        
        let size = CGSizeMake(UIScreen.mainScreen().bounds.width - 20, CGFloat(MAXFLOAT))
        let attributes = [NSFontAttributeName:UIFont.systemFontOfSize(10),NSBackgroundColorAttributeName: UIColor.redColor()];
        return self.boundingRectWithSize(size, options: options, attributes: attributes, context: context).size
    }
}
