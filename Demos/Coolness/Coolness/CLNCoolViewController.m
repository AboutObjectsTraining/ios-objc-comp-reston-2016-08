#import "CLNCoolViewController.h"
#import "CLNCoolView.h"

@implementation CLNCoolViewController


- (void)loadView
{
    CGRect screenRect = [UIScreen mainScreen].bounds;
    self.view = [[UIView alloc] initWithFrame:screenRect];
    self.view.backgroundColor = [UIColor brownColor];
    
    CLNCoolView *view1 = [[CLNCoolView alloc] initWithFrame:CGRectMake(20.0, 60.0, 80.0, 30.0)];
    CLNCoolView *view2 = [[CLNCoolView alloc] initWithFrame:CGRectMake(60.0, 100.0, 80.0, 30.0)];
    
    view1.text = @"Now on the App Store.";
    view2.text = @"Only $0.99!";
    
    [view1 sizeToFit];
    [view2 sizeToFit];
    
    view1.backgroundColor = [UIColor purpleColor];
    view2.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
}

@end
