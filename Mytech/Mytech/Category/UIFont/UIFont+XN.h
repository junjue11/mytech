//
//  UIFont+XN.h
//  LightVoice
//
//  Created by zhoujiebing on 2018/10/17.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (XN)

/**
 D-DIN字体
 */

+ (UIFont *)D_DIN_fontWithSize:(CGFloat)size;

/**
 D-DIN-Bold字体
 */

+ (UIFont *)D_DIN_Bold_fontWithSize:(CGFloat)size;

/**
 DINPro-Light字体
 */

+ (UIFont *)din_lightFontWithSize:(CGFloat)size;

/**
 DINPro-Medium字体
 */
+ (UIFont *)din_mediumFontWithSize:(CGFloat)size;

/**
 DINPro-Regular字体
 */
+ (UIFont *)din_regularFontWithSize:(CGFloat)size;

/**
 PingFangSC-Light字体
 */
+ (UIFont *)lightFontWithSize:(CGFloat)size;

/**
 PingFangSC-Medium字体
 */
+ (UIFont *)mediumFontWithSize:(CGFloat)size;

/**
 PingFangSC-Regular字体
 */
+ (UIFont *)regularFontWithSize:(CGFloat)size;

/**
 DINPro-Bold字体
 */
+ (UIFont *)din_BoldFontWithSize:(CGFloat)size;

/**
 DIN-Regular字体
 */
+ (UIFont *)din2_regularFontWithSize:(CGFloat)size;

/**
 DIN-BoldItalic字体
 */
+ (UIFont *)din_boldItalicFontWithSize:(CGFloat)size;
@end

NS_ASSUME_NONNULL_END
