
//
//  Created by admin on 16/7/1.
//  Copyright (c) 2016年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBTestHelperViewController.h"
/**
 *  自定义的window 在最上层
 */
@interface YBTestHelperTouch : UIWindow

@property (nonatomic,assign) BOOL hand;


+ (YBTestHelperTouch *)sharedTouch;

@end
