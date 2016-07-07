//
//  YBTestHelper.h
//  YYZPlus
//
//  Created by Daniel on 16/7/6.
//
//

#import <Foundation/Foundation.h>
#import "YBTestHelperTouch.h"

/**
 *  帮助处理逻辑
 */
@interface YBTestHelper : NSObject
/**
 *  启动helper
 */
+ (void)startHelper;
/**
 *  子类重载这个方法
 */
+ (void)actionDo;
/**
 *  添加快捷操作API
 *
 *  @param title 操作名
 *  @param block 操作block代码
 */
+ (void)setHelperTitle:(NSString *)title actionBlock:(dispatch_block_t)block;
/**
 *  添加结束
 */
+ (void)end;
/**
 *  让球消失
 */
+ (void)dismiss;
/**
 *  改变左右手习惯
 */
+ (void)changeHand;

@end
