//
//  YBTestHelper.m
//  YYZPlus
//
//  Created by Daniel on 16/7/6.
//
//

#import "YBTestHelper.h"
#import "YBTestHelperViewController.h"
#import "YBTestHelperDemo.h"
@implementation YBTestHelper

/**
 *  启动helper
 */
+ (void)startHelper{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
#if defined(DEBUG)
        YBTestHelperViewController *vc = [YBTestHelperViewController sharedView];
        
        [YBTestHelperTouch sharedTouch].rootViewController = vc;
        
        [YBTestHelperDemo actionDo];
    });
#endif
    
    
}

+ (void)actionDo{
    
}

+ (void)setHelperTitle:(NSString *)title actionBlock:(dispatch_block_t)block{

    [[YBTestHelperViewController sharedView].clickTitleAry addObject:title];
    [[YBTestHelperViewController sharedView].clickActionAry addObject:block];

}

+ (void)end{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"beginDraw" object:nil];
    
}

+ (void)dismiss{
    //暂时隐藏，以后要开放重新打开功能
    [YBTestHelperTouch sharedTouch].hidden = YES;
    
}

/**
 *  改变左右手习惯
 */
+ (void)changeHand{
    [YBTestHelperTouch sharedTouch].hand = ![YBTestHelperTouch sharedTouch].hand;
    [[NSUserDefaults standardUserDefaults] setBool:[YBTestHelperTouch sharedTouch].hand forKey:@"hand"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
