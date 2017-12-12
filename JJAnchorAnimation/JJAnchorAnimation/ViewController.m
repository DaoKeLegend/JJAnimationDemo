//
//  ViewController.m
//  JJAnchorAnimation
//
//  Created by mac on 2017/12/12.
//  Copyright © 2017年 DaoKeLegend. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *alertButton;

@end

@implementation ViewController

#pragma mark -  Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *alertButton = [UIButton buttonWithType:UIButtonTypeCustom];
    alertButton.frame = CGRectMake(self.view.bounds.size.width * 0.5 - 50.0, self.view.bounds.size.width * 0.5 - 50.0, 100.0, 100.0);
    [alertButton addTarget:self action:@selector(alertButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    alertButton.backgroundColor = [UIColor redColor];
    alertButton.layer.cornerRadius = 50.0;
    alertButton.layer.masksToBounds = YES;
    [self.view addSubview:alertButton];
    self.alertButton = alertButton;
}

#pragma mark -  Object Private Function

- (void)alertButtonDidClick:(UIButton *)button
{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 1.0;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [self.alertButton.layer addAnimation:animation forKey:nil];
}

@end
