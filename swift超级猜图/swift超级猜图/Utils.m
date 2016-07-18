//
//  Utils.m
//  swift超级猜图
//
//  Created by WZZ on 16/7/13.
//  Copyright © 2016年 WZZ. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (NSStringDrawingOptions)combine {
    return NSStringDrawingTruncatesLastVisibleLine |
    NSStringDrawingUsesLineFragmentOrigin |
    NSStringDrawingUsesFontLeading;
}

+ (NSIndexPath *)indexPathFor:(NSInteger)row inSection: (NSInteger)section {
    
    return [NSIndexPath indexPathForRow:row inSection:section];
}

+ (void)GCDWithTimer:(CGFloat)timer Block:(void(^)())blcok {
    

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timer * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        blcok();
    });
}

+ (NSKeyValueObservingOptions)newAndOldOptions {
    
    return NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
}

@end
