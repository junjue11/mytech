//
//  UIButton+XNImageTextLayout.m
//  VPImageComponentTest
//
//  Created by 周峻觉 on 2019/3/27.
//  Copyright © 2019年 周峻觉. All rights reserved.
//

#import "UIButton+XNImageTextLayout.h"

@implementation UIButton (XNImageTextLayout)


/// 这个方法不理想，要优化。例如：当 XNButtonLayoutStyleImageTop 是，按钮宽高不一样，图片不居中。
- (void)xn_setLayoutStyle:(XNButtonLayoutStyle)style spacing:(CGFloat)spacing {
    
    // 强制更新布局，以获得最新的 imageView 和 titleLabel 的 frame
    [self layoutIfNeeded];
    
    CGRect titleFrame = self.titleLabel.frame;
    CGRect imageFrame = self.imageView.frame;
    
    switch (style) {
        case XNButtonLayoutStyleImageLeft:
        {
            // 计算默认的图片文字间距
            CGFloat originalSpacing = titleFrame.origin.x - (imageFrame.origin.x + imageFrame.size.width);
            // 调整文字的位置
            self.titleEdgeInsets = UIEdgeInsetsMake(0,-(originalSpacing - spacing),0,(originalSpacing - spacing));
            break;
            
        }
        case XNButtonLayoutStyleImageRight:
        {
            // 图片右移
            self.imageEdgeInsets = UIEdgeInsetsMake(0,titleFrame.size.width + spacing,0,-(titleFrame.size.width + spacing));
            // 文字左移
            self.titleEdgeInsets = UIEdgeInsetsMake(0,-(titleFrame.origin.x - imageFrame.origin.x),0,titleFrame.origin.x - imageFrame.origin.x);
            break;
        }
        case XNButtonLayoutStyleImageTop:
        {
            // 图片上移，右移
            self.imageEdgeInsets = UIEdgeInsetsMake(0,0,titleFrame.size.height + spacing,-(titleFrame.size.width));
            
            // 文字下移，左移
            self.titleEdgeInsets = UIEdgeInsetsMake(imageFrame.size.height + spacing,-(imageFrame.size.width),0,0);
            break;
        }
        case XNButtonLayoutStyleImageBottom:
        {
            // 图片下移，右移
            self.imageEdgeInsets = UIEdgeInsetsMake(titleFrame.size.height + spacing,0,0,-(titleFrame.size.width));
            
            // 文字上移，左移
            self.titleEdgeInsets = UIEdgeInsetsMake(0,-(imageFrame.size.width),imageFrame.size.height + spacing,0);
            break;
        }
        default:
            break;
    }
}

@end
