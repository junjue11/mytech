//
//  UIImage+XNFactory.h
//  AidouPeipei
//
//  Created by zhoujunnjue on 2019/11/14.
//  Copyright © 2019 zhoujunnjue. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (XNFactory)

+ (NSArray<UIImage *> *)xn_imagesWithBaseString:(NSString *)baseString
                                          count:(NSInteger)count;

+ (NSArray<UIImage *> *)xn_imagesWithBaseString:(NSString *)baseString
                                     beginIndex:(NSInteger)beginIndex
                                       endIndex:(NSInteger)endIndex;

+ (NSArray<UIImage *> *)xn_imagesWithBaseString:(NSString *)baseString
                                     beginIndex:(NSInteger)beginIndex
                                       endIndex:(NSInteger)endIndex
                                          space:(NSInteger)space;

@end

NS_ASSUME_NONNULL_END
