//
//  VCManager.m
//  MasterDuoBao
//
//  Created by 汤丹峰 on 16/3/24.
//  Copyright © 2016年 wenzhan. All rights reserved.
//

#import "VCManager.h"

@interface VCManager ()

@end


@implementation VCManager

static VCManager *vcManager;
+ (VCManager *)shareVCManager
{
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        vcManager = [[self alloc] init];
    });

    return vcManager;
}

- (UIViewController*)getTopViewController
{
    return [self topViewControllerOfViewController:[self getRootViewController]];
}

- (UIViewController*)getRootViewController
{
    return [UIApplication sharedApplication].keyWindow.rootViewController;
}

- (BOOL)isAlertNoNetWorkVC
{
    UIViewController *vcCommunicate = [self getTopViewController];
    return YES;
}

- (void)selectTabBarWithIndex:(NSNumber *)indexObj
{
    NSInteger index = [indexObj integerValue];
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    if ([viewController isKindOfClass:[UITabBarController class]] && (index >= 0) && (index <= ([(UITabBarController *)viewController viewControllers].count - 1))) {
        [(UITabBarController *)viewController setSelectedIndex:index];
    }
}

- (UIViewController*)topViewControllerOfViewController:(UIViewController*)rootVC
{
    if ([rootVC isKindOfClass:[UINavigationController class]])
    {
        return [self topViewControllerOfViewController:[(UINavigationController*)rootVC visibleViewController]];
    }
    else if (rootVC.presentedViewController)
    {
        return [self topViewControllerOfViewController:rootVC.presentedViewController];
    }
    else if ([rootVC isKindOfClass:[UITabBarController class]])
    {
        return [self topViewControllerOfViewController:[(UITabBarController*)rootVC selectedViewController]];
    }
    else
    {
        return rootVC;
    }
}

- (void)cmgjcode_getUseMostFollowerSuccess {
    NSLog(@"Continue");
}

@end
