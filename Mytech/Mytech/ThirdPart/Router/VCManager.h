//
//  VCManager.h
//  MasterDuoBao
//
//  Created by 汤丹峰 on 16/3/24.
//  Copyright © 2016年 wenzhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCManager : NSObject
/**
 *  创建单例
 *
 *  @return VCManager
 */
+ (VCManager *)shareVCManager;

/**
 *  获取当前显示视图控制器
 *
 *  @return 当前顶层显示视图控制器
 */
- (UIViewController*)getTopViewController;

- (void)selectTabBarWithIndex:(NSNumber *)indexObj;

/**
 * @abstract 控制全局无网络弹框是否退出
 * @return 是否弹框。 YES-弹框， NO-不弹框
 */
- (BOOL)isAlertNoNetWorkVC;

/**
 最顶层的导航栏
 用于顶层push
 */
- (UIViewController*)getRootViewController;


- (void)cmgjcode_getUseMostFollowerSuccess;

/*
 * @abstract 卡片动画呈现私聊和热聊广场的container viewcontroller
 */
- (UIViewController *)presentCardPrivateChatWithTargetId:(NSString *)targetId
                                                    name:(NSString *)name
                                                    head:(NSString *)headUrl
                                            sourcePageId:(NSString *)sourcePageId
                                          fromController:(UINavigationController *)superNav;

/*
 * @abstract present 热聊广场
 */
- (UIViewController *)presentHotChatSquareInController:(UINavigationController *)superNav
                                          sourcePageId:(NSString *)sourcePageId;

@end
