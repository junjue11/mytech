//
//  UIFont+XN.m
//  LightVoice
//
//  Created by zhoujiebing on 2018/10/17.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import "UIFont+XN.h"

@implementation UIFont (XN)

/**
 D-DIN字体
 */

+ (UIFont *)D_DIN_fontWithSize:(CGFloat)size
{
    UIFont *font = [UIFont fontWithName:@"D-DIN" size:size*kScaleX];
    if (!font) {
        font = [UIFont systemFontOfSize:size*kScaleX];
    }
    return font;
}

/**
 D-DIN-Bold字体
 */

+ (UIFont *)D_DIN_Bold_fontWithSize:(CGFloat)size
{
    UIFont *font = [UIFont fontWithName:@"D-DIN-Bold" size:size*kScaleX];
    if (!font) {
        font = [UIFont systemFontOfSize:size*kScaleX];
    }
    return font;
}

+ (UIFont *)din_lightFontWithSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"DINPro-Light" size:size*kScaleX];
    if (!font) {
        font = [UIFont systemFontOfSize:size*kScaleX];
    }
    return font;
}


+ (UIFont *)din_mediumFontWithSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"DINPro-Medium" size:size*kScaleX];
    if (!font) {
        font = [UIFont systemFontOfSize:size*kScaleX];
    }
    return font;
}


+ (UIFont *)din_regularFontWithSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"DINPro-Regular" size:size*kScaleX];
    if (!font) {
        font = [UIFont systemFontOfSize:size*kScaleX];
    }
    return font;
}

+ (UIFont *)din_boldItalicFontWithSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"DIN-BoldItalic" size:size*kScaleX];
    if (!font) {
        font = [UIFont systemFontOfSize:size*kScaleX];
    }
    return font;
}

+ (UIFont *)lightFontWithSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Light" size:size*kScaleX];
    if (!font) {
        font = [UIFont systemFontOfSize:size*kScaleX];
    }
    return font;
}


+ (UIFont *)mediumFontWithSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Medium" size:size*kScaleX];
    if (!font) {
        font = [UIFont systemFontOfSize:size*kScaleX];
    }
    return font;
}


+ (UIFont *)regularFontWithSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:size*kScaleX];
    if (!font) {
        font = [UIFont systemFontOfSize:size*kScaleX];
    }
    return font;
}

/**
 DINPro-Bold字体
 */
+ (UIFont *)din_BoldFontWithSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"DIN-Bold" size:size*kScaleX];
    if (!font) {
        font = [UIFont systemFontOfSize:size*kScaleX];
    }
    return font;
}

/**
 DIN-Regular字体
 */
+ (UIFont *)din2_regularFontWithSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"DIN-Regular" size:size*kScaleX];
    if (!font) {
        font = [UIFont systemFontOfSize:size*kScaleX];
    }
    return font;
}
@end
