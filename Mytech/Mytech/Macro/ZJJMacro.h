//
//  ZJJMacro.h
//  Mytech
//
//  Created by 周峻觉 on 2019/3/4.
//  Copyright © 2019年 周峻觉. All rights reserved.
//

#ifndef ZJJMacro_h
#define ZJJMacro_h

#ifdef DEBUG
#define NSLog(format, ...) printf("\n%s [第%d行] %s\n",__FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(format, ...)
#endif


#define DocDir      NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]
#define CacheDir    NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0]
#define TempDir     [NSTemporaryDirectory() substringToIndex:[NSTemporaryDirectory() length]-1]


// 判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
// 判断iPhone4系列
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断iPhone5系列: iphone 5、iphone 5s 、iphone se
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断iPhone6系列
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iphone plus系列: iphone 6 plus、iphone 6s plus、iphone 7 plus、iphone 8 plus
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

// 判断iPHoneXR
#define IS_IPHONE_XR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断iPhoneX/XS
#define IS_IPHONE_XS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断iPhoneXS Max
#define IS_IPHONE_XS_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断iPhone X系列
//#define IS_IPHONE_X_Series IS_IPHONE_XR || IS_IPHONE_XS || IS_IPHONE_XS_Max
#define IS_IPHONE_X_Series ([UIScreen mainScreen].bounds.size.height >= 812.0)


#define kKeyWindow                      [UIApplication sharedApplication].keyWindow
#define kDeviceSize                     [UIScreen mainScreen].currentMode.size
#define kDeviceWidth                    [UIScreen mainScreen].currentMode.size.width
#define kDeviceHeight                   [UIScreen mainScreen].currentMode.size.height
#define kScreenBounds                   [UIScreen mainScreen].bounds
//#define kScreenWidth                    [UIScreen mainScreen].bounds.size.width
//#define kScreenHeight                   [UIScreen mainScreen].bounds.size.height
#define kStatusWidth                    [UIApplication sharedApplication].statusBarFrame.size.width
#define kStatusHeight                   [UIApplication sharedApplication].statusBarFrame.size.height
#define kNavBarWidth                    (self.navigationController ? self.navigationController.navigationBar.frame.size.width : 0)
#define kNavBarHeight                   (self.navigationController ? self.navigationController.navigationBar.frame.size.height : 0)
#define kTabBarWidth                    (self.tabBarController ? self.tabBarController.tabBar.bounds.size.width : 0)
#define kTabBarHeight                   (self.tabBarController ? self.tabBarController.tabBar.bounds.size.height : 0)
#define kStatusAndNavBarHeight          (kStatusHeight+kNavBarHeight)
#define kTabBarAndHomeIndicatorHeight   (IS_IPHONE_X_Series ? 83:49)

// 字体适配
// 以UI给的尺寸图iPhone6/6s(375*667)为例，获取屏幕的最长边，通过比例换算最终的字体大小
#define SCREEN_HEIGHT MAX([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width)
#define FontSize(R) (R)*(SCREEN_HEIGHT)/667


#define RGB(r,g,b)                      [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBA(r,g,b,a)                   [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]


#endif /* ZJJMacro_h */
