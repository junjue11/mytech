//
//  Config.h
//  building
//
//  Created by Andy on 16/9/15.
//  Copyright © 2016年 building. All rights reserved.
//

/*
 代码规范说明：
 1、下面内容仔细阅读
 2、命名：
    驼峰，成员变量除特殊一律用@property，uikit类名字后面加上相关类名eg：nameLabel。button的action要用on开头。
 3、viewcontroller内容：
    .h：不对外暴露外部不用的方法和成员变量，所有创建方法创建后必须能创建后直接使用，且外部只能用该方法创建该viewcontroller（不能使用storyboard）。传值用代理。
    .m：排序如下：系统方法（除dealloc）、public方法、private方法（button的onAction放最后）、代理
 */





#import <Foundation/Foundation.h>
#if TARGET_OS_IPHONE || TARGET_OS_TV
#import <UIKit/UIKit.h>
#else
#import <Cocoa/Cocoa.h>
#define UIColor     NSColor
#define UIView      NSView
#define UIImage     NSImage
#define UIFont      NSFont
#define UIBaselineAdjustment NSInteger
#define UIBaselineAdjustmentAlignCenters 1
#define UIGraphicsGetCurrentContext() [[NSGraphicsContext currentContext] graphicsPort]
#endif

#if TARGET_OS_IPHONE || TARGET_OS_TV
#else
#endif

#define CNYSymbol       SafeString([DMConfig sharedObjcet].selectBanknote.symbol)
#define ISCNY           [LocalizedString(LocaleLanguageCode) isEqualToString:@"zh_CN"]

#define kline_price_types @[@(IDX_PriceIdx_MA), @(IDX_PriceIdx_EMA), @(IDX_PriceIdx_BOLL)]
#define kline_main_types @[@(IDX_VOLUMN)]
#define kline_types @[@(IDX_MACD), @(IDX_KDJ), @(IDX_RSI), @(IDX_TRIX)]
//强制刷新
//static NSNotificationName const FocusRefrshChangeNotification = @"FocusRefrshChangeNotification";
//
//
//static NSString * const kKlineViewControllerSelectIndexKey = @"kKlineViewControllerSelectIndexKey";
//static NSString * const kKlineViewControllerSelectNameKey = @"kKlineViewControllerSelectNameKey";
//
//static NSString * const kKlineViewControllerDefualtSelectIndexKey = @"kKlineViewControllerDefualtSelectIndexKey";
//static NSString * const kKlineViewControllerPriceIdxTypeKey = @"kKlineViewControllerPriceIdxTypeKey";
//static NSString * const kKlineViewControllerIdxTypeKey = @"kKlineViewControllerIdxTypeKeyV2";
//static NSString * const kKlineViewControllerMainIdxTypeKey = @"kKlineViewControllerMainIdxTypeKey";
//static NSString * const kKlineViewControllerColorConfigKey = @"kKlineViewControllerColorConfigKey";

// 网络请求地址，release地址不要修改
#if DEBUG
//#define SERVER_BASE_URL @"http://api.beta.mytokenio.com/"
#define SERVER_BASE_URL @"http://betaapi.mytokenapi.com"
#else
#define SERVER_BASE_URL @"http://api.mytokenapi.com"
#endif
#define SERVER_Socket_URL @"ws.mytoken.io:10011"
#define SERVER_H5_Share_URL @"http://app.mytoken.io/j"
#define AppStoreId @"1271352380"
#define AppUpdateLateTime (60 * 60 * 24)
#define ViewPanBackLeftSpace 30    //右滑返回灵敏度
#define iOSAppLink @"https://itunes.apple.com/app/id1271352380"
#define AndroidAppLink @"https://mytoken.io/app"

#if DEBUG
#define Coding(x)
#define isDebug true
#define isMySelfIphone [[UDID udid] isEqualToString:@"b19b11cbd31746869dbae233bd64ef2792a88e22"]
#else
#define isDebug false
#define Coding 开发中，relase不能编译
#endif

#if DEBUG
#define kGtAppId           @"FxCVzJaXOK9zpWh7MdqsE2"
#define kGtAppSecret       @"6w9fncVY5RAMKL6WD1XNI"
#define kGtAppKey          @"adrwYR85K48zlIUOe7cuuA"
#else
#define kGtAppId           @"PA62XhaADe85vqNw6m0652"
#define kGtAppSecret       @"7tcwD7bzu5AA8izTPn40e2"
#define kGtAppKey          @"HEL3v7xTij9DsFp2jamK5"
#endif

#if DEBUG
#define EDLog(...) NSLog(@"vdLog: %@", [NSString stringWithFormat:__VA_ARGS__])
#else
# define EDLog(...) {}
#endif

/*! runtime添加对象类型property
 */
#define ADDPROPERTY(PROPERTY_TYPE,PROPERTY_NAME,SETTER_NAME) \
static char kProperty##PROPERTY_NAME; \
- (PROPERTY_TYPE)PROPERTY_NAME \
{ \
return (PROPERTY_TYPE) objc_getAssociatedObject(self, &(kProperty##PROPERTY_NAME)); \
} \
\
- (void)SETTER_NAME:(PROPERTY_TYPE)PROPERTY_NAME \
{ \
objc_setAssociatedObject(self, &kProperty##PROPERTY_NAME, PROPERTY_NAME, OBJC_ASSOCIATION_RETAIN); \
} \

/*! runtime添加基础类型类型property
*/
#define ADDNumberPROPERTY(PROPERTY_TYPE,PROPERTY_NAME,SETTER_NAME) \
@dynamic PROPERTY_NAME; \
static char kProperty##PROPERTY_NAME; \
- (PROPERTY_TYPE)PROPERTY_NAME \
{ \
return [objc_getAssociatedObject(self, &(kProperty##PROPERTY_NAME)) PROPERTY_TYPE##Value]; \
} \
\
- (void)SETTER_NAME:(PROPERTY_TYPE)PROPERTY_NAME \
{ \
objc_setAssociatedObject(self, &kProperty##PROPERTY_NAME, @(PROPERTY_NAME), OBJC_ASSOCIATION_RETAIN); \
} \


// width height
#define WINDOW_WIDTH CGRectGetWidth([UIApplication sharedApplication].keyWindow.frame)
#define WINDOW_HEIGHT CGRectGetHeight([UIApplication sharedApplication].keyWindow.frame)

// weakify strongify
#define weakify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
autoreleasepool{} __weak __typeof__(x) __weak_##x##__ = x; \
_Pragma("clang diagnostic pop")

#define strongify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
try{} @finally{} __typeof__(x) x = __weak_##x##__; \
_Pragma("clang diagnostic pop")

#pragma mark --View Color
//设置RGB颜色
#define UIColorFromRGBA(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF000000) >> 24))/255.0 green:((float)((rgbValue & 0xFF0000) >> 16))/255.0 blue:((float)((rgbValue & 0xFF00) >> 8))/255.0 alpha:(rgbValue & 0xFF)/255.]
#define UIColorFromRGB(rgbValue,rgbalpha) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:rgbalpha]
#define UIColorWithRGBA(rgbred,rgbgreen,rgbblue,rgbalpha) [UIColor colorWithRed:rgbred/255.0 green:rgbgreen/255.0 blue:rgbblue/255.0 alpha:rgbalpha]

/**
 *  主题色
 */
//#define Color_ThemeColor                    UIColorFromRGB(0xf0f0f0, 1.0)
#define Color_ThemeGreenColor               UIColorFromRGB(0x03a600, 0.9)
#define Color_ThemeRedColor                 UIColorFromRGB(0xf23d3d, 0.9)
//#define Color_ThemeGreenColor               UIColorFromRGB(0x23A621, 1.0)
//#define Color_ThemeRedColor                 UIColorFromRGB(0xD93636, 1.0)
#define Color_KlineGreenColor               UIColorFromRGB(0x50B369, 1.0)
#define Color_KlineRedColor                 UIColorFromRGB(0xD94E41, 1.0)

#define Color_ThemeBlueColor                UIColorFromRGB(0x007AFF, 1.0)
#define Color_ButtonThemeColor              UIColorFromRGB(0x007AFF, 1.0)
#define Color_ButtonThemeHighlightColor     UIColorFromRGB(0x0069c0, 1.0)
#define Color_44                            UIColorFromRGB(0x444444, 1.0)

/**
 *  主界面背景色
 */
//#define Color_ViewBackGroundColor           UIColorFromRGB(0xf1f1f1, 1.0)
//toast的背景
#define Color_AlphaGrayColor                UIColorFromRGB(0x616161, 0.3)
#define Color_ButtonGrayColor               UIColorFromRGB(0xbdbdbd, 1.0)
#define Color_ButtonSelectColor             UIColorFromRGB(0xe40000, 1.0)
#define Color_AdaColor                      UIColorFromRGB(0xe0a622, 1.0)


// 小红点颜色
#define Color_BadgeRedColor                 UIColorFromRGB(0xd0021b, 1.0)

/**
 图片站位是显示的灰色色值
 */
#define Color_ImagePlaceholderColor         UIColorFromRGB(0xe0e0e0, 1.0)
/**
 *  cell正常的背景色
 */
//#define Color_CellBackgroundColor           UIColorFromRGB(0xffffff, 1.0)
//#define COLOR_Cell_LINE                     UIColorFromRGB(0xaaaaaa, 0.2) // Separator Line Color
//#define COLOR_LINE_Dark_BD                  UIColorFromRGB(0xbdbdbd, 1.0) // dark Line Color
/**
 *  cell高亮的背景色
 */
#define Color_CellHighlightColor            UIColorFromRGB(0xe2ebcf, 1.0)
#pragma mark --Text Color
/**
 *  text color
 */
#define Color_Text_Title                    UIColorFromRGB(0x000000, 1.0f)
#define Color_Text88                        UIColorFromRGB(0x888888, 1.0f)
#define Color_TextAA                        UIColorFromRGB(0xaaaaaa, 1.0f)

#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#pragma mark --Font

#define Font(x,y) ([UIFont respondsToSelector:@selector(systemFontOfSize:weight:)] ? [UIFont systemFontOfSize:x weight:y] : [UIFont systemFontOfSize:x])

#define FONT_TITLE_BOLD     fontOfSize(16)
#define FONT_17             fontOfSize(17)
#define FONT_16             fontOfSize(16)
#define FONT_15             fontOfSize(15)
#define FONT_14             fontOfSize(14)
#define FONT_13             fontOfSize(13)
#define FONT_12             fontOfSize(12)
#define FONT_11             fontOfSize(11)
#define FONT_10             fontOfSize(10)
#define NavigationItemFont  Font(16, UIFontWeightRegular)


// 获取屏幕宽度高度，不允许使用[[UIScreen mainScreen] bounds]来设置view的frame
#define WindowWidth CGRectGetWidth([UIApplication sharedApplication].keyWindow.bounds)
#define WindowHeight CGRectGetHeight([UIApplication sharedApplication].keyWindow.bounds)

#define AnimationDurationDefault 0.25   //uiview动画的默认时间
#define AnimationDurationSpeedy 0.12    //uiview动画快速时间
#define ViewLayerCornerRadius 5.        //layer.cornerRadius圆角默认

//section高度
#define TableViewHeaderHeight 9.

/**
 *  UIImage 加载界面
 */
#define PlaceholderImage  getPlaceholderImage()
#define AvaterPlaceholderImage [UIImage imageNamed:@"avatar_default"]
#define MatchPlaceholderImage getMatchPlaceholderImage()

// 返回非nilstring
#define SafeString(x) (isNilString(x) ? @"" : x)
#define SureString(x) ([x isKindOfClass:[NSString class]] ? x : [x description])
#define isZHCN [LocalizedString(LocaleLanguageCode) isEqualToString:@"zh_CN"]

// 初始化设置
//void installNavigationStyle();

//判断string是否为空，不要用length来判断
#define isNilString(x) functionIsNilString(x)
bool functionIsNilString(NSString *string);
#define String(x) ([x isKindOfClass:[NSNull class]] ? x : [x description])
NSString *getChickenSoupForTheSoul(void);
NSUserDefaults *groupDefaults(void);
NSInteger versionCode(NSString *version);
UIImage *getPlaceholderImage(void);
BOOL getIsIpad(void);
NSArray *safeStringArray(NSArray *array);
//转换成万、亿
NSString *formatterWan(double value);
//UIImpactFeedbackGenerator
void impactFeedbackGenerator(UIImpactFeedbackStyle style);
//font 只创建一次
UIFont *fontOfSize(CGFloat size);
#define sectionRow(section,row) (100*section+row)

//从StoryBoard创建viewcontroller，只能用该define方法，且只能在viewcontroller里面创建自己，其他的不许创建，只能调用要创建viewcontroller的public方法
#ifndef StoryBoardWithName
#define StoryBoardWithName(x) [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:x]
#endif

typedef NS_ENUM(NSUInteger, DirectionType) {
    DirectionTypeNone = 0,
    DirectionTypeDes,
    DirectionTypeAse,
};
NSString *directionValue(DirectionType type);



