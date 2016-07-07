//
//  YBTestHelperViewController.m
//  YBProjectTestHelper
//
//  Created by Daniel on 16/7/1.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "YBTestHelperViewController.h"
#import "YBHelperInfoView.h"
#import "YBTestHelperTouch.h"
@interface YBTestHelperViewController (){
    
    YBHelperInfoView *infoView;
}

@end

@implementation YBTestHelperViewController

+ (YBTestHelperViewController *)sharedView{
    static dispatch_once_t once;
    static YBTestHelperViewController *sharedView;
    dispatch_once(&once, ^ { sharedView = [YBTestHelperViewController new]; });
    return sharedView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.clickTitleAry = [NSMutableArray array];
    self.clickActionAry = [NSMutableArray array];
    
    infoView = [[YBHelperInfoView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
    [self.view addSubview:infoView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginDraw) name:@"beginDraw" object:nil];


}

- (void)beginDraw{
    
    NSMutableArray *ary = [YBTestHelperViewController sharedView].clickTitleAry;
    for (NSInteger i=0; i<[YBTestHelperViewController sharedView].clickTitleAry.count; i++) {
        UIButton *tempBtn = [[UIButton alloc] initWithFrame:(CGRect){5+95*(i%3), 80+ 50*(floor(i/3)),90, 40}];
        [tempBtn setTitle:[YBTestHelperViewController sharedView].clickTitleAry[i] forState:UIControlStateNormal];
        [tempBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [tempBtn setBackgroundColor:[UIColor redColor]];
        tempBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [tempBtn addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];
        tempBtn.tag = i;
        tempBtn.layer.cornerRadius = 5.0f;
        tempBtn.alpha = 0;
        [[YBTestHelperViewController sharedView].view addSubview:tempBtn];

    }
    
}

- (void)doAction:(id)sender{
    
    UIButton *btnA = (UIButton *)sender;
    dispatch_block_t tpBlcok = self.clickActionAry[btnA.tag];
    if (tpBlcok) {
        tpBlcok();
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
