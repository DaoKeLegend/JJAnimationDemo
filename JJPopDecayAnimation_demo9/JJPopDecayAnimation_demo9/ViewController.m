//
//  ViewController.m
//  JJPopDecayAnimation_demo9
//
//  Created by lucy on 2017/12/17.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"
#import "POP.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *animaObjectView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self loadDecayAnimation];
}

#pragma mark - Action && Notification

- (void)loadDecayAnimation
{
    POPDecayAnimation *decayAnimation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    [self.animaObjectView.layer pop_addAnimation:decayAnimation forKey:@"decayAnimation"];
    decayAnimation.velocity = @(300.0);
    decayAnimation.fromValue = @(200.0);
    decayAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished){
        if (finished) {
            NSLog(@"动画结束了");
            [self.animaObjectView.layer pop_removeAnimationForKey:@"decayAnimation"];
            [self loadDecayAnimation];
        }
    };
}

@end
