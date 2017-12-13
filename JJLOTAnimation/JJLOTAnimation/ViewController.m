//
//  ViewController.m
//  JJLOTAnimation
//
//  Created by mac on 2017/12/11.
//  Copyright © 2017年 DaoKeLegend. All rights reserved.
//

#import "ViewController.h"
#import "Lottie.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) LOTAnimationView *circleAnimation;
@property (nonatomic, strong) LOTAnimationView *liveAnimation;;

@end

@implementation ViewController

#pragma mark -  Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self initUI];
}

#pragma mark -  Object Private Function'

- (void)initUI
{
    //头像后面的外扩动画
    CGRect frame = CGRectMake(0, 0, 180, 180);
    LOTAnimationView *circleAnimation = [LOTAnimationView animationNamed: @"homepage_circle"];
    circleAnimation.frame = frame;
    circleAnimation.contentMode = UIViewContentModeScaleAspectFill;
    circleAnimation.clipsToBounds = YES;
    circleAnimation.loopAnimation = YES;
    [self.view addSubview: circleAnimation];
    self.circleAnimation = circleAnimation;
   
    
    //头像
    self.imageView = [[UIImageView alloc] init];
    self.imageView.frame = CGRectMake(self.view.bounds.size.width * 0.5 - 50.0, 200.0, 100.0, 100.0);
    self.imageView.backgroundColor = [UIColor blueColor];
    self.imageView.layer.cornerRadius = 50.0;
    self.imageView.layer.masksToBounds = YES;
    [self.view addSubview:self.imageView];
    
    self.circleAnimation.center = self.imageView.center;
    
    //直播中动画
    LOTAnimationView *liveAnimation = [LOTAnimationView animationNamed: @"homepage_live"];
    liveAnimation.loopAnimation = YES;
    [self.view addSubview: liveAnimation];
    self.liveAnimation = liveAnimation;
    [self.liveAnimation mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.imageView);
        make.top.equalTo(self.imageView.mas_bottom).offset(50.0);
        make.width.equalTo(@100.0);
        make.height.equalTo(@50.0);
    }];
    
    [self.circleAnimation play];
    [self.liveAnimation play];
}

@end













