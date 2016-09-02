#import "CLNCoolViewController.h"
#import "CLNCoolView.h"


@interface CLNCoolViewController () <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UIView *contentView;
@end


@implementation CLNCoolViewController

- (IBAction)addCoolView
{
    NSLog(@"In %s, text is %@\n", __func__, self.textField.text);
    CLNCoolView *newCoolView = [[CLNCoolView alloc] init];
    newCoolView.text = self.textField.text;
    [newCoolView sizeToFit];
    
    [self.contentView addSubview:newCoolView];
}



- (void)loadView2
{
    [[NSBundle mainBundle] loadNibNamed:@"CoolStuff" owner:self options:nil];
}


- (void)loadView1
{
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CoolStuff" owner:nil options:nil];
    UIView *backgroundView = topLevelObjects.firstObject;
    self.view = backgroundView;
}

- (void)XXXviewDidLoad
{
    [super viewDidLoad];
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    self.contentView.clipsToBounds = YES;
    
    UIView *accessoryView = self.view.subviews[0];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20.0, 40.0, CGRectGetWidth(screenRect) - 120.0, 30.0)];
    [accessoryView addSubview:self.textField];
    
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"Enter some text";
    self.textField.delegate = self;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Add" forState:UIControlStateNormal];
    [button sizeToFit];
    
    [accessoryView addSubview:button];
    button.frame = CGRectOffset(button.frame, CGRectGetWidth(screenRect) - 80.0, 40.0);
    
    [button addTarget:self action:@selector(addCoolView) forControlEvents:UIControlEventTouchUpInside];
    
    // Cool Views
    
    CLNCoolView *view1 = [[CLNCoolView alloc] initWithFrame:CGRectMake(20.0, 30.0, 80.0, 30.0)];
    CLNCoolView *view2 = [[CLNCoolView alloc] initWithFrame:CGRectMake(60.0, 100.0, 80.0, 30.0)];
    
    view1.text = @"Now on the App Store.";
    view2.text = @"Only $0.99!";
    
    [view1 sizeToFit];
    [view2 sizeToFit];
    
    view1.backgroundColor = [UIColor purpleColor];
    view2.backgroundColor = [UIColor orangeColor];
    
    [self.contentView addSubview:view1];
    [self.contentView addSubview:view2];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
