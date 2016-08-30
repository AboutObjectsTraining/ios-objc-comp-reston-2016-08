#import "AppDelegate.h"
#import "CoolViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CGRect screenRect = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc] initWithFrame:screenRect];
    self.window.backgroundColor = [UIColor lightGrayColor];
    
    self.window.rootViewController = [[CoolViewController alloc] initWithNibName:nil bundle:nil];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
