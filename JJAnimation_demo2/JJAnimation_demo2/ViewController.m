//
//  ViewController.m
//  JJAnimation_demo2
//
//  Created by lucy on 2017/12/2.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Tool.h"

@interface ViewController ()

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

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self startAnimation];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.testImageView = [[UIImageView alloc] init];
    self.testImageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.testImageView];
}

- (void)startAnimation
{
    self.giftWidth = 100.0;
    self.giftHeight = 100.0;
    self.startXRatio = 0.2;
    self.startYRatio = 0.3;
    self.pauseXRatio = 0.5;
    self.pauseYRatio = 0.5;
    self.endXRatio = 0.8;
    self.endYRatio = 1.0;
    self.startDuration = 5;
    self.pauseDuration = 1;
    self.endDuration = 5;
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    self.testImageView.frame = CGRectMake(100.0, 100.0, 100.0, 100.0);
    
    NSLog(@"开始动画了");
    
//    //动画
//    CGFloat totalDuration = self.startDuration + self.pauseDuration + self.endDuration;
//    [UIView animateKeyframesWithDuration:totalDuration
//                                   delay:0
//                                 options:UIViewKeyframeAnimationOptionAllowUserInteraction | UIViewKeyframeAnimationOptionBeginFromCurrentState
//                              animations:^{
//                                  //start
//                                  CGFloat startTime = 0.f;
//                                  CGFloat duration =  self.startDuration / totalDuration;
//                                  [UIView addKeyframeWithRelativeStartTime:startTime
//                                                          relativeDuration:duration
//                                                                animations:^{
//                                                                    self.testImageView.origin = CGPointMake(self.pauseXRatio * screenSize.width,
//                                                                                                            self.pauseYRatio * screenSize.height);
//                                                                }];
//
//                                  //pause
//                                  startTime += duration;
//                                  duration = self.pauseDuration / totalDuration;
//                                  [UIView addKeyframeWithRelativeStartTime:startTime
//                                                          relativeDuration:duration
//                                                                animations:^{}];
//                                  //end
//                                  startTime += duration;
//                                  duration = self.endDuration / totalDuration;
//                                  [UIView addKeyframeWithRelativeStartTime:startTime
//                                                          relativeDuration:duration
//                                                                animations:^{
//                                                                    self.testImageView.origin = CGPointMake(self.endXRatio * screenSize.width,
//                                                                                                            self.endYRatio * screenSize.height);
//                                                                }];
//                              } completion:^(BOOL finished) {
//
//                                  NSLog(@"over");
//                              }];
    
        [UIView animateWithDuration:0 delay:0 options:0 animations:^{
                self.testImageView.frame = CGRectMake(50.0, 100.0, 100.0, 100.0);
        } completion:^(BOOL finished) {
            //动画
            CGFloat totalDuration = self.startDuration + self.pauseDuration + self.endDuration;
            [UIView animateKeyframesWithDuration:totalDuration
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionAllowUserInteraction | UIViewKeyframeAnimationOptionBeginFromCurrentState
                                      animations:^{
                                          //start
                                          CGFloat startTime = 0.f;
                                          CGFloat duration =  self.startDuration / totalDuration;
                                          [UIView addKeyframeWithRelativeStartTime:startTime
                                                                  relativeDuration:duration
                                                                        animations:^{
                                                                            self.testImageView.origin = CGPointMake(self.pauseXRatio * screenSize.width,
                                                                                                                    self.pauseYRatio * screenSize.height);
                                                                        }];
    
                                          //pause
                                          startTime += duration;
                                          duration = self.pauseDuration / totalDuration;
                                          [UIView addKeyframeWithRelativeStartTime:startTime
                                                                  relativeDuration:duration
                                                                        animations:^{}];
                                          //end
                                          startTime += duration;
                                          duration = self.endDuration / totalDuration;
                                          [UIView addKeyframeWithRelativeStartTime:startTime
                                                                  relativeDuration:duration
                                                                        animations:^{
                                                                            self.testImageView.origin = CGPointMake(self.endXRatio * screenSize.width,
                                                                                                                    self.endYRatio * screenSize.height);
                                                                        }];
                                      } completion:^(BOOL finished) {
    
                                          NSLog(@"over");
                                      }];
        }];
}

@end
