//
//  AppDelegate.m
//  IOS_OC_SL
//
//  Created by 柯南 on 2021/8/18.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    ViewController *homeVC = [[ViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    self.window.rootViewController = homeNav;
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
