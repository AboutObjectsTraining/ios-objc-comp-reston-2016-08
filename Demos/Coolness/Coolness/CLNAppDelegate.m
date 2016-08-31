#import "CLNAppDelegate.h"
#import "CLNCoolViewController.h"

@implementation CLNAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CGRect screenRect = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc] initWithFrame:screenRect];
    self.window.backgroundColor = [UIColor lightGrayColor];
    
    CLNCoolViewController *controller = [[CLNCoolViewController alloc] init];
    //    UIView *backgroundView = controller.view;
    //    [self.window addSubview:backgroundView];
    //    self.window.rootViewController = controller;
    
    [self.window setRootViewController:controller];
    [self.window makeKeyAndVisible];
    
    return YES;
}

//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = touches.anyObject;
//    CGPoint currLocation = [touch locationInView:touch.view];
//    CGPoint prevLocation = [touch previousLocationInView:touch.view];
//    
//    CGPoint newLocation = touch.view.center;
//    newLocation.x += currLocation.x - prevLocation.x;
//    newLocation.y += currLocation.y - prevLocation.y;
//    
//    touch.view.center = newLocation;
//}

@end
