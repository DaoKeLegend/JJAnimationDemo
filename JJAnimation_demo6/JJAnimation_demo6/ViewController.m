//
//  ViewController.m
//  JJAnimation_demo6
//
//  Created by lucy on 2017/12/16.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"
#import "JJAnimationView.h"

@interface ViewController ()

@property (nonatomic, strong) JJAnimationView *animationView;
@property (nonatomic, strong) UIView *maskView;

@end

@implementation ViewController

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //粉色开始动画按钮
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(15.0, 150.0, self.view.bounds.size.width - 30.0, 30.0)];
    [button setTitle:@"开始动画" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(startAnimationButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:button];
}

#pragma mark - Action && Notification

- (void)startAnimationButtonDidClick:(UIButton *)button
{
    //遮罩
    UIView *maskView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    maskView.backgroundColor = [UIColor clearColor];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissAnimationView)];
    [maskView addGestureRecognizer:tapGesture];
    [self.view addSubview:maskView];
    self.maskView = maskView;
    
    JJAnimationView *animationView = [[JJAnimationView alloc] initWithFrame:CGRectMake(15.0, 180.0, self.view.bounds.size.width - 30.0, 0.0)];
    [self.maskView addSubview:animationView];
    self.animationView = animationView;
    
    [UIView animateWithDuration:5 animations:^{
        animationView.frame = CGRectMake(15.0, 180.0, self.view.bounds.size.width - 30.0, 200);
    } completion:^(BOOL finished) {

    }];
}

- (void)dismissAnimationView
{
    [UIView animateWithDuration:5 animations:^{
        self.animationView.frame = CGRectMake(15.0, 180.0, self.view.bounds.size.width - 30.0, 0);
    } completion:^(BOOL finished) {
        [self.maskView removeFromSuperview];
    }];
}

@end
