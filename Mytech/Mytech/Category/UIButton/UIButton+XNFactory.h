//
//  UIButton+XNFactory.h
//  AidouPeipei
//
//  Created by zhoujunnjue on 2019/11/14.
//  Copyright © 2019 zhoujunnjue. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (XNFactory)

+ (UIButton *)xn_buttonWithSize:(CGSize)size
                      imageName:(NSString *)imageName
                         target:(id)target
                         action:(SEL)action;

+ (UIButton *)xn_buttonWithSize:(CGSize)size
                          title:(NSString *)title
                     titleColor:(UIColor *)titleColor
                           font:(UIFont *)font
                         target:(id)target
                         action:(SEL)action;

- (void)xn_setTitleColor:(UIColor *)color selectedTitleColor:(UIColor *)selectedColor;
- (void)xn_setImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName;

@end

NS_ASSUME_NONNULL_END
