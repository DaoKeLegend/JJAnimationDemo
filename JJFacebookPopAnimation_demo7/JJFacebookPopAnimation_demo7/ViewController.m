//
//  ViewController.m
//  JJFacebookPopAnimation_demo7
//
//  Created by lucy on 2017/12/17.
//  Copyright © 2017年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"
#import "POP.h"
#import "PDAnimationManager.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UISlider *bounceSlider;
@property (strong, nonatomic) IBOutlet UISlider *speedSlider;
@property (strong, nonatomic) IBOutlet UISwitch *tensionSwitch;
@property (strong, nonatomic) IBOutlet UISlider *tensionSlider;
@property (weak, nonatomic) IBOutlet UISwitch *FrictionSwitch;
@property (weak, nonatomic) IBOutlet UISlider *frictionSlider;
@property (weak, nonatomic) IBOutlet UISwitch *massSwitch;
@property (weak, nonatomic) IBOutlet UISlider *massSlider;

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, assign) CGFloat bouncinessValue;
@property (nonatomic, assign) CGFloat speedTweakValue;
@property (nonatomic, strong) CALayer *popCircle;
@property (nonatomic, assign) BOOL animated;
@property (nonatomic, strong) NSString *animationType;
@property (nonatomic, strong) NSArray *animationTypes;
@property (nonatomic, copy) NSString *exampleID;

@end

@implementation ViewController

#pragma mark - Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.center = CGPointMake(self.view.center.x, self.view.center.y - 1000.0);
    [self.tableView setContentInset:UIEdgeInsetsMake(66,0,0,0)];
    self.animationType = kPOPLayerScaleXY;
    [self setPopCircle];
    [self.view addSubview:self.tableView];
}

#pragma mark - Object Private Function

- (void)setPopCircle
{
    self.popCircle = [CALayer layer];
    
    [self resetCircle];
    
    [self.view.layer addSublayer:self.popCircle];
    
    self.animationTypes = @[kPOPLayerBackgroundColor,kPOPLayerBounds,kPOPLayerOpacity,kPOPLayerPosition,kPOPLayerRotation,
                            kPOPLayerScaleXY,kPOPLayerSize,kPOPLayerTranslationXY,kPOPLayerRotationX, kPOPLayerRotationY];
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView reloadData];
}

- (void)resetCircle
{
    [self.popCircle pop_removeAllAnimations];
    self.popCircle.opacity = 1.0;
    self.popCircle.transform = CATransform3DIdentity;
    [self.popCircle setMasksToBounds:YES];
    [self.popCircle setBackgroundColor:[UIColor redColor].CGColor];
    [self.popCircle setCornerRadius:25.0f];
    [self.popCircle setBounds:CGRectMake(0.0f, 0.0f, 50.0f, 50.0f)];
    self.popCircle.position = CGPointMake(self.view.center.x, 180.0);
}

- (void)hideTableView
{
    [self resetCircle];
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.window.center.x, -1000.0)];
    [self.tableView pop_addAnimation:anim forKey:@"AnimationHide"];
    
    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            [self performAnimation];
        }
    };
}

- (void)setAnimationWithBounciness:(CGFloat)bounciness andSpeed:(CGFloat)speed
{
    [self.popCircle pop_removeAllAnimations];
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:self.animationType];
    
    [PDAnimationManager springObject:self.popCircle configAnimation:anim WithType:self.animationType andAnimated:self.animated];
    
    self.animated = !self.animated;
    anim.springBounciness = bounciness;
    anim.springSpeed = speed;
    
    if (self.FrictionSwitch.isOn) {
        anim.dynamicsFriction = self.frictionSlider.value;
    }
    
    if (self.tensionSwitch.isOn) {
        anim.dynamicsTension = self.tensionSlider.value;
    }
    
    if (self.massSwitch.isOn) {
        anim.dynamicsMass = self.massSlider.value;
    }
    
    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            
            [self performAnimation];
        }
    };
    
    [self.popCircle pop_addAnimation:anim forKey:@"Animation"];
    
}

- (void)performAnimation
{
    [self setAnimationWithBounciness:self.bounceSlider.value andSpeed:self.speedSlider.value];
}

#pragma mark - Action && Notification

- (IBAction)showEffect:(id)sender
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

- (IBAction)sliderValueChanged:(id)sender
{
    [self resetCircle];
    [self performAnimation];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.animationTypes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
    cell.textLabel.text = [self.animationTypes objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.animationType = [self.animationTypes objectAtIndex:indexPath.row];
    [self hideTableView];
}

@end










