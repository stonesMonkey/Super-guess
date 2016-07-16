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

@end
