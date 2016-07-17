//
//  Utils.h
//  swift超级猜图
//
//  Created by WZZ on 16/7/13.
//  Copyright © 2016年 WZZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Utils : NSObject

+ (NSStringDrawingOptions)combine;

+ (NSIndexPath *)indexPathFor:(NSInteger)row inSection: (NSInteger)section;

// 因为怎么写都写不出GCD
+ (void)GCDWithTimer:(CGFloat)timer Block:(void(^)())blcok;

@end
