//
//  UIImage+Extension.h
//  Mytech
//
//  Created by 周峻觉 on 2019/3/7.
//  Copyright © 2019年 周峻觉. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extension)


- (UIImage *_Nullable)imageWithSize:(CGSize)size color:(UIColor *_Nullable)color;

//截取当前屏幕
+ (UIImage *)getScreenShot;
+ (UIImage *)imageWithScreenshot;

#pragma mark - 使用新的高度，等比例的放大或缩小图片的大小。返回新的图片大小。
- (CGSize)scaleSizeWithNewHeight:(CGFloat)newHeight;

#pragma mark - 使用新的宽度，等比例的放大或缩小图片的大小。返回新的图片大小。
- (CGSize)scaleSizeWithNewWidth:(CGFloat)newWidth;

#pragma mark - 使用新的宽度等比例缩放图片
+ (nullable UIImage *)imageWithImage:(nonnull UIImage *)image height:(CGFloat)height;

#pragma mark - 使用新的宽度等比例缩放图片
+ (nullable UIImage *)imageWithImage:(nonnull UIImage *)image width:(CGFloat)width;

#pragma mark - 使用新的宽-高绘制图片,压缩image
+ (UIImage *_Nullable)scaledImage:(UIImage *_Nullable)image size:(CGSize)size;

#pragma mark - 裁剪出最大的方形image
+ (UIImage*_Nullable)squareImageWithImage:(UIImage *_Nullable)image;

#pragma mark - 通过UIBezierPath,裁剪不规则形状的图片
+ (UIImage* _Nullable)clipedImageWithImage:(UIImage *_Nullable)image path:(UIBezierPath *_Nullable)path;

+ (nullable UIImage *)fliter:(nullable NSString *)filterName image:(nullable UIImage *)image;

//如果图片大于2M，会自动旋转90度；否则不旋转
#pragma mark - 照相机获取到的图片自动旋转90度解决办法
+ (nullable UIImage *)fixOrientation:(nullable UIImage *)aImage;

+ (UIImage *_Nullable)imageFromView:(UIView *_Nullable)theView opaque:(BOOL)opaque;

+ (UIImage *_Nullable)imageByApplyingAlpha:(CGFloat )alpha image:(UIImage*_Nullable)image;

+ (UIImage *_Nullable)imageNamed:(NSString *_Nullable)name renderingModel:(UIImageRenderingMode)model;

@end

NS_ASSUME_NONNULL_END
