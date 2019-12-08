//
//  UILabel+XNFactory.h
//  YamiLive
//
//  Created by zhoujunnjue on 2019/11/8.
//  Copyright © 2019 xiaoniu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (XNFactory)

+ (UILabel *)xn_labelWithTextColor:(UIColor *)textColor
                              font:(UIFont *)font;

+ (UILabel *)xn_labelWithTextColor:(UIColor *)textColor
                              font:(UIFont *)font
                     textAlignment:(NSTextAlignment)alignment;

+ (UILabel *)xn_labelWithTextColor:(UIColor *)textColor
                              font:(UIFont *)font
                     textAlignment:(NSTextAlignment)alignment
                     numberOfLines:(NSInteger)num;

+ (UILabel *)xn_labelWithTextColor:(UIColor *)textColor
                              font:(UIFont *)font
                     textAlignment:(NSTextAlignment)alignment
                     numberOfLines:(NSInteger)num
                              text:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
