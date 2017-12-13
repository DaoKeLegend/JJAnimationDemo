//
//  ViewController.m
//  JJEmitterAnimation
//
//  Created by mac on 2017/12/11.
//  Copyright © 2017年 DaoKeLegend. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CAEmitterLayer *fireEmitterLayer;

@end

@implementation ViewController

#pragma mark -  Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];

    //下雪的动画
//    [self beginSnow];
    
    //烟花
    [self setFirework];

}

#pragma mark -  Object Private Function

- (void)setFirework
{
    self.fireEmitterLayer                   = [CAEmitterLayer layer];
    // 发射源
    self.fireEmitterLayer.emitterPosition   = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height - 50);
    // 发射源尺寸大小
    self.fireEmitterLayer.emitterSize       = CGSizeMake(50, 0);
    // 发射源模式
    self.fireEmitterLayer.emitterMode       = kCAEmitterLayerOutline;
    // 发射源的形状
    self.fireEmitterLayer.emitterShape      = kCAEmitterLayerLine;
    // 渲染模式
    self.fireEmitterLayer.renderMode        = kCAEmitterLayerAdditive;
    // 发射方向
    self.fireEmitterLayer.velocity          = 1;
    // 随机产生粒子
    self.fireEmitterLayer.seed              = (arc4random() % 100) + 1;
    
    
    // cell
    CAEmitterCell *cell             = [CAEmitterCell emitterCell];
    // 速率
    cell.birthRate                  = 1.0;
    // 发射的角度
    cell.emissionRange              = 0.11 * M_PI;
    // 速度
    cell.velocity                   = 300;
    // 范围
    cell.velocityRange              = 150;
    // Y轴 加速度分量
    cell.yAcceleration              = 75;
    // 声明周期
    cell.lifetime                   = 2.04;
    //是个CGImageRef的对象,既粒子要展现的图片
    cell.contents                   = (id)[[UIImage imageNamed:@"circle"] CGImage];
    // 缩放比例
    cell.scale                      = 0.3;
    // 粒子的颜色
    cell.color                      = [[UIColor colorWithRed:0.6
                                                       green:0.6
                                                        blue:0.6
                                                       alpha:1.0] CGColor];
    // 一个粒子的颜色green 能改变的范围
    cell.greenRange                 = 1.0;
    // 一个粒子的颜色red 能改变的范围
    cell.redRange                   = 1.0;
    // 一个粒子的颜色blue 能改变的范围
    cell.blueRange                  = 1.0;
    // 子旋转角度范围
    cell.spinRange                  = M_PI;
    
    
    // 爆炸
    CAEmitterCell *burst            = [CAEmitterCell emitterCell];
    // 粒子产生系数
    burst.birthRate                 = 1.0;
    // 速度
    burst.velocity                  = 0;
    // 缩放比例
    burst.scale                     = 2.5;
    //粒子red在生命周期内的改变速度
    burst.redSpeed                  = -1.5;
    //粒子blue在生命周期内的改变速度
    burst.blueSpeed                 = +1.5;
    //粒子green在生命周期内的改变速度
    burst.greenSpeed                = +1.0;
    //生命周期
    burst.lifetime                  = 0.35;
    
    
    // 火花
    CAEmitterCell *spark            = [CAEmitterCell emitterCell];
    //粒子产生系数，默认为1.0
    spark.birthRate                 = 400;
    //速度
    spark.velocity                  = 125;
    // 360 deg//周围发射角度
    spark.emissionRange             = 2 * M_PI;
    // gravity//y方向上的加速度分量
    spark.yAcceleration             = 75;
    //粒子生命周期
    spark.lifetime                  = 3;
    //是个CGImageRef的对象,既粒子要展现的图片
    spark.contents                  = (id)[[UIImage imageNamed:@"spark"] CGImage];
    //缩放比例速度
    spark.scaleSpeed                = -0.2;
    //粒子green在生命周期内的改变速度
    spark.greenSpeed                = -0.1;
    //粒子red在生命周期内的改变速度
    spark.redSpeed                  = 0.4;
    //粒子blue在生命周期内的改变速度
    spark.blueSpeed                 = -0.1;
    //粒子透明度在生命周期内的改变速度
    spark.alphaSpeed                = -0.25;
    //子旋转角度
    spark.spin                      = 2* M_PI;
    //子旋转角度范围
    spark.spinRange                 = 2* M_PI;
    
    
    self.fireEmitterLayer.emitterCells = [NSArray arrayWithObject:cell];
    cell.emitterCells = [NSArray arrayWithObjects:burst, nil];
    burst.emitterCells = [NSArray arrayWithObject:spark];
    [self.view.layer addSublayer:self.fireEmitterLayer];
}

- (void)beginSnow
{
    CAEmitterLayer *snowEmitterLayer = [CAEmitterLayer layer];
    snowEmitterLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:snowEmitterLayer];
    
    //指定发射源的位置
    snowEmitterLayer.emitterPosition = CGPointMake(self.view.bounds.size.width / 2, -10);
    
    //指定发射源的大小
    snowEmitterLayer.emitterSize  = CGSizeMake(self.view.bounds.size.width, 0.0);
    
    //指定发射源的形状 和 模式
    snowEmitterLayer.emitterShape = kCAEmitterLayerLine;
    snowEmitterLayer.emitterMode  = kCAEmitterLayerOutline;
    
    //创建CAEmitterCell
    CAEmitterCell *snowCell = [CAEmitterCell emitterCell];
    
    //每秒多少个
    snowCell.birthRate = 3.0;
    
    //存活时间
    snowCell.lifetime = 100.0;
    
    //初速度 因为动画属于落体效果，所以我们只需要设置它在 y 方向上的加速度就行了。
    snowCell.velocity = 10;
    
    //初速度范围
    snowCell.velocityRange = 5;
    
    //y方向的加速度
    snowCell.yAcceleration = 3;
    
    snowCell.emissionRange = 0;
    
    snowCell.contents = (id)[[UIImage imageNamed:@"snow"] CGImage];
    
    //缩小
    snowCell.scale = 0.3;
    
    snowEmitterLayer.emitterCells = [NSArray arrayWithObject:snowCell];
}

@end
