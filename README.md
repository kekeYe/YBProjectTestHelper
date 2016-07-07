# YBProjectTestHelper
解决平时开发过程中的一些小麻烦

###导入只需要三步
* 第一步拖入工程文件
* 第二步在AppDelegate 导入头文件#import "YBTestHelper.h"
* 最后启动[YBTestHelper startHelper];


###使用
* 生成YBTestHelper子类 实现actionDo方法
* 调用+ (void)setHelperTitle:(NSString *)title actionBlock:(dispatch_block_t)block;
* 最后调用end方法

##具体例子可查看demo 


1. 温馨提示:事件自定义需要自己重写子类  YBTestHelper  看demo的 YBTestHelperDemo.m就好
2. 信息版自定义需要改          YBHelperInfoView

1.0版本 有时间再更新...