//
//  YBHelperInfoView.m
//  YYZPlus
//
//  Created by Daniel on 16/7/6.
//
//

#import "YBHelperInfoView.h"
// 获取当前设备可用内存及所占内存的头文件
#import <sys/sysctl.h>
#import <mach/mach.h>




@interface YBHelperInfoView (){
    UILabel *iPinfoLabel;
    UILabel *memoryLabel;
}

@end

@implementation YBHelperInfoView
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self =[super initWithFrame:frame]) {
        
        iPinfoLabel = [[UILabel alloc] init];
        iPinfoLabel.textColor = [UIColor whiteColor];
        iPinfoLabel.font = [UIFont systemFontOfSize:14];
        iPinfoLabel.frame = CGRectMake(5, 0, 280, 30);

        [self addSubview:iPinfoLabel];
        
        memoryLabel = [[UILabel alloc] init];
        memoryLabel.textColor = [UIColor whiteColor];
        memoryLabel.font = [UIFont systemFontOfSize:14];
        memoryLabel.frame = CGRectMake(5, 35, 280, 30);
   
        [self addSubview:memoryLabel];
        
        
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(infoLabelShow) userInfo:nil repeats:YES];

        self.alpha = 0;
        
        
    }
    return self;
}

- (void)infoLabelShow{

    iPinfoLabel.text = [NSString stringWithFormat:@"当前访问服务器地址:%@",@"192.168.1.1"];
    
    memoryLabel.text = [NSString stringWithFormat:@"可用内存%.1fMB占用内存%.1fMB",[self availableMemory],[self usedMemory]];
    
    
    
}
// 获取当前设备可用内存(单位：MB）
- (double)availableMemory
{
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(),
                                               HOST_VM_INFO,
                                               (host_info_t)&vmStats,
                                               &infoCount);
    
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }
    
    return ((vm_page_size *vmStats.free_count) / 1024.0) / 1024.0;
}

// 获取当前任务所占用的内存（单位：MB）
- (double)usedMemory
{
    task_basic_info_data_t taskInfo;
    mach_msg_type_number_t infoCount = TASK_BASIC_INFO_COUNT;
    kern_return_t kernReturn = task_info(mach_task_self(),
                                         TASK_BASIC_INFO,
                                         (task_info_t)&taskInfo,
                                         &infoCount);
    
    if (kernReturn != KERN_SUCCESS
        ) {
        return NSNotFound;
    }
    
    return taskInfo.resident_size / 1024.0 / 1024.0;
}

@end
