//
//  UIView+ViewToImage.m
//  Mytech
//
//  Created by 周峻觉 on 2019/11/24.
//  Copyright © 2019 周峻觉. All rights reserved.
//

#import "UIView+ViewToImage.h"


@implementation UIView (ViewToImage)

+ (UIImage*)my_convertViewToImage:(UIView*)view {
    CGSize s = view.bounds.size;
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
