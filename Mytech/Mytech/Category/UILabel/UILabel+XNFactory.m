//
//  UILabel+XNFactory.m
//  YamiLive
//
//  Created by zhoujunnjue on 2019/11/8.
//  Copyright © 2019 xiaoniu. All rights reserved.
//

#import "UILabel+XNFactory.h"


@implementation UILabel (XNFactory)

+ (UILabel *)xn_labelWithTextColor:(UIColor *)textColor
                              font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = textColor;
    return label;
}

+ (UILabel *)xn_labelWithTextColor:(UIColor *)textColor
                              font:(UIFont *)font
                     textAlignment:(NSTextAlignment)alignment {
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = textColor;
    label.textAlignment = alignment;
    return label;
}

+ (UILabel *)xn_labelWithTextColor:(UIColor *)textColor
                              font:(UIFont *)font
                     textAlignment:(NSTextAlignment)alignment
                     numberOfLines:(NSInteger)num {
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = textColor;
    label.textAlignment = alignment;
    label.numberOfLines = num;
    return label;
}

+ (UILabel *)xn_labelWithTextColor:(UIColor *)textColor
                              font:(UIFont *)font
                     textAlignment:(NSTextAlignment)alignment
                     numberOfLines:(NSInteger)num
                              text:(NSString *)text {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    label.textAlignment = alignment;
    label.numberOfLines = num;
    return label;
}

@end
