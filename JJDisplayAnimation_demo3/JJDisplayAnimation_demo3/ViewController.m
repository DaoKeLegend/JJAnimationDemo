//
//  ViewController.m
//  JJDisplayAnimation_demo3
//
//  Created by lucy on 2017/12/3.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) BOOL isRedBird;


@end

@implementation ViewController

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.frame = CGRectMake(100, 300, 200, 200);
    [self.view addSubview:self.imageView];
    
    self.isRedBird = YES;
    
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(startAnimation)];
    if ([[UIDevice currentDevice].systemVersion floatValue] < 10.0) {
        displayLink.frameInterval = 60/20;
    }
    else {
        displayLink.preferredFramesPerSecond = 60/20;
    }
    
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

#pragma mark - Action && Notification

- (void)startAnimation
{
    if (self.isRedBird) {
        self.imageView.image = [UIImage imageNamed:@"bird_red"];
    }
    else {
        self.imageView.image = [UIImage imageNamed:@"bird_blue"];
    }
    
    self.isRedBird = !self.isRedBird;
}

@end
