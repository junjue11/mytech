//
//  UIButton+XNImageTextLayout.h
//  VPImageComponentTest
//
//  Created by 周峻觉 on 2019/3/27.
//  Copyright © 2019年 周峻觉. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, XNButtonLayoutStyle) {
    XNButtonLayoutStyleImageLeft,
    XNButtonLayoutStyleImageRight,
    XNButtonLayoutStyleImageTop,
    XNButtonLayoutStyleImageBottom,
};

@interface UIButton (XNImageTextLayout)

- (void)xn_setLayoutStyle:(XNButtonLayoutStyle)style spacing:(CGFloat)spacing;

@end

NS_ASSUME_NONNULL_END
