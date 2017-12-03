//
//  ViewController.m
//  JJDisplayAnmation_demo5
//
//  Created by lucy on 2017/12/3.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"
#import "JJJumpVC.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) CADisplayLink *displayLink;

@end

@implementation ViewController

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 100.0, 100.0, 100.0)];
    self.imageView.backgroundColor = [UIColor redColor];
    self.imageView.userInteractionEnabled = YES;
    [self.view addSubview:self.imageView];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewDidTapped:)];
    [self.imageView addGestureRecognizer:tapGesture];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0.0, 100.0, self.view.bounds.size.width, 40.0);
    [self.view addSubview:button];
    
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(startAnimation)];
    if ([[UIDevice currentDevice].systemVersion floatValue] < 10.0) {
        displayLink.frameInterval = 60/20;
    }
    else {
        displayLink.preferredFramesPerSecond = 60/20;
    }
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    self.displayLink = displayLink;
}

#pragma mark - Object Private Function

- (void)startAnimation
{
    CGFloat margin = (700 - 100) / 20;
    self.imageView.frame = CGRectMake(self.imageView.frame.origin.x, self.imageView.frame.origin.y + margin, 100.0, 100.0);
    
    if (self.imageView.frame.origin.y == 700) {
        [self.displayLink invalidate];
        self.displayLink = nil;
    }
}

#pragma mark - Action && Notification

- (void)imageViewDidTapped:(UITapGestureRecognizer *)tapGesture
{
    NSLog(@"我是被点击了吗");
}

- (void)buttonDidClick:(UIButton *)button
{
    JJJumpVC *jumpVC = [[JJJumpVC alloc] init];
    [self.navigationController pushViewController:jumpVC animated:YES];
}

@end
