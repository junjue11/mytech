//
//  Config.m
//  building
//
//  Created by Andy on 16/9/15.
//  Copyright © 2016年 building. All rights reserved.
//

#import "Config.h"
#import "NSString+Formatter.h"

//void installNavigationStyle() {    
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//
//    [UITextField appearance].tintColor = Color_ThemeColor;
//
////        let barButtonItem = UIBarButtonItem.appearance()
////        barButtonItem.tintColor = Config.Color.Theme
////        barButtonItem.setTitleTextAttributes([NSForegroundColorAttributeName : Config.Color.White], forState: .Normal)
//    
//    UINavigationBar *navigationBar = [UINavigationBar appearance];
//    navigationBar.tintColor = [UIColor blackColor];
//    navigationBar.barTintColor = Color_ThemeColor;
//    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor]};
//    navigationBar.translucent = false;
//
//    UITabBar *tabBar = [UITabBar appearance];
//    tabBar.tintColor = Color_ThemeColor;
////    tabBar.selectedImageTintColor = Config.Color.Theme
//    
//}

bool functionIsNilString(NSString *string) {
    if (![string isKindOfClass:[NSString class]]) {
        return true;
    }
    
    return !(string.length > 0);
}

#define GroupBundleIdentifier @"group.com.hash.mytoken"
NSUserDefaults *groupDefaults() {
    static NSUserDefaults *sharedDefaults = nil;
    if (!sharedDefaults) {
#if TARGET_OS_IPHONE || TARGET_OS_TV
        sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:GroupBundleIdentifier];
        [sharedDefaults synchronize];
#else
        sharedDefaults = [NSUserDefaults standardUserDefaults];
#endif
    }

    return sharedDefaults;
}

NSInteger versionCode(NSString *version){
	NSArray<NSString *> *array = [version componentsSeparatedByString:@"."];
	__block NSInteger code = 0;
	__block NSInteger up = 10000;
	[array enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		code += [obj integerValue] * up;
		up /= 100;
	}];

	return code;
}

UIImage *getPlaceholderImage() {
	static UIImage *image = nil;
	if (!image) {
		image = [UIImage new];
	}

	return image;
}

BOOL getIsIpad(void) {
#if TARGET_OS_IPHONE || TARGET_OS_TV
    
    NSString *deviceType = [UIDevice currentDevice].model;
    
    if([deviceType isEqualToString:@"iPhone"]) {
        //iPhone
        return NO;
    }
    else if([deviceType isEqualToString:@"iPod touch"]) {
        //iPod Touch
        return NO;
    }
    else if([deviceType isEqualToString:@"iPad"]) {
        //iPad
        return YES;
    }
    
#elif TARGET_OS_MAC
#endif

    return NO;
}

NSString *directionValue(DirectionType direction) {
    switch (direction) {
        case DirectionTypeNone:
            return nil;
            break;
        case DirectionTypeAse:
            return @"asc";
            break;
        case DirectionTypeDes:
            return @"desc";
            break;
    }
}

NSArray *safeStringArray(NSArray *array) {
    if (![array isKindOfClass:[NSArray class]])
        return nil;
    
    NSMutableArray *newArray = [NSMutableArray array];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [newArray addObject:SafeString(obj)];
    }];
    return newArray;
}

NSString *getLocaleLanguageFileName() {
    static NSString *static_language = nil;
    
    if (static_language == nil) {
        NSArray  *languages = [NSLocale preferredLanguages];
        NSString *language = [languages objectAtIndex:0];
        EDLog(@"languageslanguageslanguages %@", language);
        if ([language hasPrefix:@"zh-Hans"]) {
            static_language = @"zh-Hans";
        } else if ([language hasPrefix:@"zh-Hant"]) {
            static_language = @"zh-Hant";
        } else if ([language hasPrefix:@"ja"]) {
            static_language = @"ja";
        } else if ([language hasPrefix:@"ko"]) {
            static_language = @"ko";
        }else if ([language hasPrefix:@"vi"]) {
            static_language = @"vi-VN";
        }
        else if ([language hasPrefix:@"id"]) {
            static_language = @"id";
        }else {
            static_language = @"en";
        }
    }
    
    return static_language;
}

NSString *formatterWan(double value)
{
    NSString *volumeString = nil;

    BOOL isCNY = YES;
    if (isCNY) {
        if (value >= 100000000) {
            volumeString = [NSString stringWithFormat:@"%.2f亿",value / 100000000.];
        } else if (value >= 10000) {
            volumeString = [NSString stringWithFormat:@"%.2f万",value / 10000.];
        } else {
            volumeString = formarterLimitPrice(value);
        }
    } else {
        if (value >= 1000. * 1000 * 1000) {
            volumeString = [NSString stringWithFormat:@"%.2fb",value / (1000. * 1000 * 1000)];
        } else if (value >= 1000 * 1000) {
            volumeString = [NSString stringWithFormat:@"%.2fm",value / (1000. * 1000)];
        } else if (value >= 1000) {
            volumeString = [NSString stringWithFormat:@"%.2fk",value / 1000.];
        } else {
            volumeString = formarterLimitPrice(value);
        }
    }

    return volumeString;
}

void impactFeedbackGenerator(UIImpactFeedbackStyle style) {
    if (@available(iOS 10.0, *)) {
        UIImpactFeedbackGenerator *feedBackGenertor = [[UIImpactFeedbackGenerator alloc] initWithStyle:style];
        [feedBackGenertor impactOccurred];
    }
}

//font 只创建一次
UIFont *fontOfSize(CGFloat size) {
    static NSMutableDictionary *mutableFonts = nil;
    if (!mutableFonts) {
        mutableFonts = [NSMutableDictionary dictionary];
    }
    
    UIFont *font = [mutableFonts objectForKey:@(size)];
    if (!font) {
        font = [UIFont systemFontOfSize:size];
        [mutableFonts setObject:font forKey:@(size)];
    }
    
    return font;
}



