//
//  ViewController.m
//  JJFacebookPopDecay_demo8
//
//  Created by lucy on 2017/12/17.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"
#import "PDAnimationManager.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UISlider *velocitySlider;
@property (weak, nonatomic) IBOutlet UISlider *decelerationSlider;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *popCircle;
@property (nonatomic, assign) BOOL animated;
@property (nonatomic, copy) NSString *animationType;
@property (nonatomic, strong) NSArray *animationTypes;

@end

@implementation ViewController

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.center = CGPointMake(self.view.center.x, self.view.center.y - 1000.0);
    [self.tableView setContentInset:UIEdgeInsetsMake(66,0,0,0)];
    
    
    self.animationType = kPOPLayerPositionX;
    [self setPopCircle];
    
    [self.view addSubview:self.tableView];
    
    [self performAnimation];
}

#pragma mark - Object Private Function

- (void)hideTableView
{
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.window.center.x, -1000.0)];
    [self.tableView pop_addAnimation:anim forKey:@"AnimationHide"];
    
    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            [self resetCircle];
            [self performAnimation];
        }
    };
}


- (void)setPopCircle
{
    self.popCircle = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    
    [self resetCircle];
    
    [self.view addSubview:self.popCircle];
    
    self.animationTypes = @[kPOPLayerBackgroundColor,kPOPLayerBounds,kPOPLayerOpacity,kPOPLayerPosition, kPOPLayerPositionX ,kPOPLayerRotation,
                            kPOPLayerScaleXY,kPOPLayerSize,kPOPLayerTranslationXY,kPOPLayerRotationX, kPOPLayerRotationY];
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView reloadData];
}

- (void)resetCircle
{
    [self.popCircle.layer pop_removeAllAnimations];
    self.popCircle.layer.opacity = 1.0;
    self.popCircle.layer.transform = CATransform3DIdentity;
    [self.popCircle.layer setMasksToBounds:YES];
    [self.popCircle.layer setBackgroundColor:[UIColor colorWithRed:0.16 green:0.72 blue:1.0 alpha:1.0].CGColor];
    [self.popCircle.layer setCornerRadius:25.0f];
    [self.popCircle setBounds:CGRectMake(0.0f, 0.0f, 50.0f, 50.0f)];
    self.popCircle.layer.position = CGPointMake(self.view.center.x, 180.0);
    self.animated = NO;
}

- (void)performAnimation
{
    [self.popCircle.layer pop_removeAllAnimations];
    
    POPDecayAnimation *anim = [POPDecayAnimation animationWithPropertyNamed:self.animationType];
    
    [PDAnimationManager decayObject:self.popCircle.layer configAnimation:anim WithType:self.animationType andAnimated:self.animated andVelocitySlider:self.velocitySlider];
    
    anim.deceleration = self.decelerationSlider.value;
    
    self.animated = !self.animated;
    
    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            
            [self performAnimation];
        }
    };
    
    [self.popCircle.layer pop_addAnimation:anim forKey:@"Animation"];
}


#pragma mark - Action && Notification

- (IBAction)sliderValueChanged:(id)sender
{
    [self resetCircle];
    [self performAnimation];
}

- (IBAction)showEffect:(UIButton *)sender
{
    [self resetCircle];
    
    if (self.tableView.center.y > 0) {
        [self hideTableView];
    }
    else{
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
        anim.toValue = [NSValue valueWithCGPoint:self.view.center];
        [self.tableView pop_addAnimation:anim forKey:@"AnimationShow"];
    }
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.animationTypes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
    cell.textLabel.text = [self.animationTypes objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.animationType = [self.animationTypes objectAtIndex:indexPath.row];
    [self hideTableView];
}

@end
