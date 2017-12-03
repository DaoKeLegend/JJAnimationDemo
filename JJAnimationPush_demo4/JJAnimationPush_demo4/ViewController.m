//
//  ViewController.m
//  JJAnimationPush_demo4
//
//  Created by lucy on 2017/12/3.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"
#import "JJJumpVC.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 100.0, 100.0)];
    imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:imageView];
    
    [UIView animateWithDuration:10 animations:^{
        imageView.frame = CGRectMake(350.0, 500.0, 100.0, 100.0);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    JJJumpVC *jumpVC = [[JJJumpVC alloc] init];
    [self.navigationController pushViewController:jumpVC animated:YES];
}

@end
