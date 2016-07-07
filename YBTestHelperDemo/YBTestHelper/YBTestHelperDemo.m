//
//  YBTestHelperDemo.m
//  YYZPlus
//
//  Created by Daniel on 16/7/6.
//
//

#import "YBTestHelperDemo.h"


@implementation YBTestHelperDemo

+ (void)actionDo{


    [self setHelperTitle:@"login" actionBlock:^{
        NSLog(@"login");
    }];
    
    [self setHelperTitle:@"goback" actionBlock:^{
        NSLog(@"goback");
    }];
    
    [self setHelperTitle:@"close me" actionBlock:^{
        NSLog(@"close me");
        [self dismiss];
    }];
    
    [self end];
    
    
}

@end
