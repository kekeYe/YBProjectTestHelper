//
//  YBTestHelperViewController.h
//  YBProjectTestHelper
//
//  Created by Daniel on 16/7/1.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  VC 承载显示
 */
@interface YBTestHelperViewController : UIViewController

+ (YBTestHelperViewController *)sharedView;

@property (nonatomic,strong)  NSMutableArray<NSString *> *clickTitleAry;

@property (nonatomic,strong)  NSMutableArray<dispatch_block_t > *clickActionAry;

@end
