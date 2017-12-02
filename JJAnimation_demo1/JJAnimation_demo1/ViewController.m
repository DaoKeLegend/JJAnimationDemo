//
//  ViewController.m
//  JJAnimation_demo1
//
//  Created by lucy on 2017/12/2.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"
#import "JJGiftView.h"

@interface ViewController ()

@property (nonatomic, strong) JJGiftView *giftView;


@end

@implementation ViewController

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.giftView = [[JJGiftView alloc] init];
    self.giftView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.giftView];
    [self.giftView startAnimation];
}

@end
