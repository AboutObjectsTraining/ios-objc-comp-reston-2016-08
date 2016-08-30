#import "CoolViewController.h"
#import "CoolView.h"

@implementation CoolViewController


- (void)loadView
{
    CGRect screenRect = [UIScreen mainScreen].bounds;
    self.view = [[UIView alloc] initWithFrame:screenRect];
    self.view.backgroundColor = [UIColor brownColor];
    
    UIView *view1 = [[CoolView alloc] initWithFrame:CGRectMake(20.0, 60.0, 80.0, 30.0)];
    UIView *view2 = [[CoolView alloc] initWithFrame:CGRectMake(60.0, 100.0, 80.0, 30.0)];
    
    view1.backgroundColor = [UIColor purpleColor];
    view2.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
}

@end
