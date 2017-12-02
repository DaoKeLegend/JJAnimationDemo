//
//  JJGiftView.m
//  JJAnimation_demo1
//
//  Created by lucy on 2017/12/2.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "JJGiftView.h"

@interface JJGiftView()

@property (nonatomic, strong) UIImageView *testImageView;
@property (nonatomic, assign) CGFloat giftWidth;
@property (nonatomic, assign) CGFloat giftHeight;
@property (nonatomic, assign) CGFloat startXRatio;
@property (nonatomic, assign) CGFloat startYRatio;
@property (nonatomic, assign) CGFloat pauseXRatio;
@property (nonatomic, assign) CGFloat pauseYRatio;
@property (nonatomic, assign) CGFloat endXRatio;
@property (nonatomic, assign) CGFloat endYRatio;
@property (nonatomic, assign) CGFloat startDuration;
@property (nonatomic, assign) CGFloat endDuration;
@property (nonatomic, assign) CGFloat pauseDuration;

@end

@implementation JJGiftView

#pragma mark - Override Base Function

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewDidTapped:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGPoint locationPoint = [self.layer convertPoint:point toLayer:self.layer.presentationLayer];
    CALayer *layer = self.layer.presentationLayer;
    if(CGRectContainsPoint(layer.bounds, locationPoint)){
        return self;
    }
    
    if (!self.layer.presentationLayer) {
        return [super hitTest:point withEvent:event];
    }
    return nil;
}


#pragma mark - Object Private Function

- (void)startAnimation
{
    self.giftWidth = 100.0;
    self.giftHeight = 100.0;
    self.startXRatio = 0.2;
    self.startYRatio = 0.1;
    self.pauseXRatio = 0.5;
    self.pauseYRatio = 0.5;
    self.endXRatio = 0.8;
    self.endYRatio = 1.0;
    self.startDuration = 5;
    self.pauseDuration = 1;
    self.endDuration = 5;
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    //其实位置
    self.frame = CGRectMake(self.startXRatio * screenSize.width, self.startYRatio * screenSize.height, self.giftWidth, self.giftHeight);
    
    [UIView animateWithDuration:self.startDuration delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.frame = CGRectMake(self.pauseXRatio * screenSize.width, self.pauseYRatio * screenSize.height, self.giftWidth, self.giftHeight);
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.pauseDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:self.endDuration delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                self.frame = CGRectMake(self.endXRatio * screenSize.width, self.endYRatio * screenSize.height, self.giftWidth, self.giftHeight);
            } completion:^(BOOL finished) {
                NSLog(@"动画结束了");
            }];
        });
    }];
    
}

#pragma mark - Action && Notification

- (void)imageViewDidTapped:(UITapGestureRecognizer *)tapGesture
{
    CGFloat redValue = arc4random_uniform(255)/255.0;
    CGFloat greenValue = arc4random_uniform(255)/255.0;
    CGFloat blueValue = arc4random_uniform(255)/255.0;
    self.backgroundColor = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0];
}

@end



