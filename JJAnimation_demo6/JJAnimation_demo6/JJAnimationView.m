//
//  JJAnimationView.m
//  JJAnimation_demo6
//
//  Created by lucy on 2017/12/16.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "JJAnimationView.h"

@interface JJAnimationView()

@property (nonatomic, strong) UIView *maskView;

@end

@implementation JJAnimationView

#pragma mark - Override Base Function

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
        self.clipsToBounds = YES;
        [self initUI];
    }
    return self;
}

#pragma mark - Object Private Function

- (void)initUI
{
    //顶部视图
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(15.0, 10.0, self.bounds.size.width - 30, 60.0)];
    topView.backgroundColor = [UIColor blueColor];
    [self addSubview:topView];

    //底部视图
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(topView.frame), CGRectGetMaxY(topView.frame) + 15.0, CGRectGetWidth(topView.frame), 60.0)];
    bottomView.backgroundColor = [UIColor redColor];
    [self addSubview:bottomView];
}

@end
