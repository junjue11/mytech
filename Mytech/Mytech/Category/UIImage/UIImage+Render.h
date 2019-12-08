//
//  UIImage+RenderedImage.h
//  ZJOL
//
//  Created by Peter Jin (https://github.com/JxbSir) on  15/1/6.
//  Copyright (c) 2015年 PeterJin.   Email:i@jxb.name      All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIImage (Render)

+ (UIImage *)imageWithRenderColor:(UIColor *)color renderSize:(CGSize)size;

+ (UIImage *)imageGradientRenderWithColors:(NSArray *)colors renderSize:(CGSize)size;//水平渐变

+ (UIImage *)imageWithOriginalImage:(UIImage *)image quality:(CGFloat)quality;

+ (UIImage *)imageColGradientRenderWithColors:(NSArray *)colors renderSize:(CGSize)size;//垂直渐变

+ (UIImage *)xn_getCommonGradienImage:(CGSize)size;


//压缩图片

-(NSData *)compressMidQualityWithLengthLimit:(NSInteger)maxLength;

@end
