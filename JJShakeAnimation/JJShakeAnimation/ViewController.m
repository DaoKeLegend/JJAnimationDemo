//
//  ViewController.m
//  JJShakeAnimation
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
    [self.view addSubview:alertButton];
    self.alertButton = alertButton;
}

#pragma mark -  Object Private Function

- (void)alertButtonDidClick:(UIButton *)button
{
    button.selected = !button.selected;
    
    if (button.selected) {
        srand([[NSDate date] timeIntervalSince1970]);
        float rand=(float)random();
        CFTimeInterval t=rand*0.0000000001;
        
        [UIView animateWithDuration:0.1 delay:t options:0  animations:^
         {
             self.alertButton.transform = CGAffineTransformMakeRotation(-0.05);
         } completion:^(BOOL finished)
         {
             [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionAllowUserInteraction  animations:^
              {
                  self.alertButton.transform = CGAffineTransformMakeRotation(0.05);
              } completion:^(BOOL finished) {}
              ];
         }];
    }
    else {
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState animations:^
         {
             self.alertButton.transform = CGAffineTransformIdentity;
         } completion:^(BOOL finished) {
             
         }];
    }
}

@end
