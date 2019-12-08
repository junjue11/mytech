//
//  UIButton+XNFactory.m
//  AidouPeipei
//
//  Created by zhoujunnjue on 2019/11/14.
//  Copyright © 2019 zhoujunnjue. All rights reserved.
//

#import "UIButton+XNFactory.h"


@implementation UIButton (XNFactory)

+ (UIButton *)xn_buttonWithSize:(CGSize)size imageName:(NSString *)imageName target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [button setImage:XNImage(imageName) forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.adjustsImageWhenHighlighted = NO;
    return button;
}

+ (UIButton *)xn_buttonWithSize:(CGSize)size title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.adjustsImageWhenHighlighted = NO;
    return button;
}

- (void)xn_setTitleColor:(UIColor *)color selectedTitleColor:(UIColor *)selectedColor
{
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:selectedColor forState:UIControlStateSelected];
}

- (void)xn_setImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    [self setImage:XNImage(imageName) forState:UIControlStateNormal];
    [self setImage:XNImage(selectedImageName) forState:UIControlStateSelected];
}

@end
