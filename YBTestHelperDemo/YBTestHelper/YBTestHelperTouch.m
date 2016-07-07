
//  Created by admin on 16/7/1.
//  Copyright (c) 2016年 Daniel. All rights reserved.
#import "YBTestHelperTouch.h"

#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define RECTNORMAL CGRectMake(0, 0, (kScreenWidth/3.0f)*2, (kScreenWidth/3.0f)*2)
#define SIZENORMAL CGSizeMake(300, 300)

@interface YBTestHelperTouch (){
    
    UIImageView *_imageView;
    
    UIView *menuView;

    
}
@property(nonatomic,assign)BOOL isShowMenu;
@end


@implementation YBTestHelperTouch

+ (YBTestHelperTouch*)sharedTouch {
    static dispatch_once_t once;
    static YBTestHelperTouch *sharedView;
    dispatch_once(&once, ^ { sharedView = [[YBTestHelperTouch alloc]initWithFrame:CGRectMake(100, 70, 40, 40) imageName:@"YBTestHelpericon.png"]; });
    return sharedView;
}


- (id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame imageName:(NSString *)name
{
    if(self = [super initWithFrame:frame])
    {
        
        self.windowLevel = UIWindowLevelStatusBar+100;
        [self makeKeyAndVisible];
        _imageView = [[UIImageView alloc]initWithFrame:(CGRect){0, 0,frame.size.width, frame.size.height}];
        _imageView.image = [UIImage imageNamed:name];
        _imageView.alpha = 1;
        _imageView.layer.cornerRadius = 20.0f;
        _imageView.layer.masksToBounds = YES;
        [self addSubview:_imageView];

        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(locationChange:)];
        [self addGestureRecognizer:pan];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
        [self addGestureRecognizer:tap];
        
        [self creatMenu];
        self.isShowMenu=YES;
        //默认左手
        
        self.hand = [[NSUserDefaults standardUserDefaults] objectForKey:@"hand"];

        NSLog(@"end");

    }
    return self;
}


-(void)buttonchange
{
    if (self.isShowMenu) {

        self.isShowMenu=false;
        menuView.frame = CGRectMake(0, 0, 0, 0);
        menuView.hidden = NO;
        [UIView animateWithDuration:0.2 animations:^{
            menuView.frame = CGRectMake(0, 0, SIZENORMAL.width, SIZENORMAL.height);
            
        } completion:^(BOOL finished) {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, SIZENORMAL.width, SIZENORMAL.height);
            
        }];
        
        for (UIView *view in [YBTestHelperViewController sharedView].view.subviews) {
            [UIView animateWithDuration:0.3 animations:^{
                view.alpha = 1;
            }];
            
        };
        
    }
    else
    {

        self.isShowMenu=true;
        
        [UIView animateWithDuration:0.2 animations:^{
            menuView.frame = CGRectMake(0, 0, 0, 0);
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, 44, 44);
        } completion:^(BOOL finished) {
            menuView.hidden = YES;
            
        }];
        
        for (UIView *view in [YBTestHelperViewController sharedView].view.subviews) {
            [UIView animateWithDuration:0.1 animations:^{
                view.alpha = 0;
            }];
            
        };
        
    }
    
    
}

//改变位置
-(void)locationChange:(UIPanGestureRecognizer*)p
{
    if(p.state == UIGestureRecognizerStateChanged)
    {
        _imageView.alpha = 1;
    }
    
    CGPoint panPoint = [p locationInView:[[[UIApplication sharedApplication] windows] objectAtIndex:0]];

    if (!self.isShowMenu) {
        if (self.hand == YES) {
            self.frame = CGRectMake(panPoint.x-100, panPoint.y-100, self.frame.size.width, self.frame.size.height);
        }else{
            self.frame = CGRectMake(panPoint.x-200, panPoint.y-200, self.frame.size.width, self.frame.size.height);
        }
        
    }else{
        self.frame = CGRectMake(panPoint.x, panPoint.y, self.frame.size.width, self.frame.size.height);
    }
    
}
//点击事件
-(void)click:(UITapGestureRecognizer*)t
{

    [self buttonchange];
    [self performSelector:@selector(changeColor) withObject:nil afterDelay:0.2];
}

-(void)changeColor
{
    [UIView animateWithDuration:1.0 animations:^{
        _imageView.alpha = 0.3;
    }];
}

- (void)creatMenu{
    
    if (!menuView) {
        menuView = [[UIView alloc] initWithFrame:RECTNORMAL];
        menuView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        menuView.layer.cornerRadius = 8.0f;
        menuView.hidden = YES;
        [self addSubview:menuView];
    }
    
}


@end
