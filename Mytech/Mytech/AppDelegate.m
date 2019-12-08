//
//  AppDelegate.m
//  Mytech
//
//  Created by 周峻觉 on 2019/11/24.
//  Copyright © 2019 周峻觉. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    HomeViewController *homeVC = [[HomeViewController alloc] initWithStyle:UITableViewStyleGrouped];
    homeVC.title = @"首页";
    
    UINavigationController *homeNC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = homeNC;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
