//
//  UIImage+XNFactory.m
//  AidouPeipei
//
//  Created by zhoujunnjue on 2019/11/14.
//  Copyright © 2019 zhoujunnjue. All rights reserved.
//

#import "UIImage+XNFactory.h"

@implementation UIImage (XNFactory)

+ (NSArray<UIImage *> *)xn_imagesWithBaseString:(NSString *)baseString
                               count:(NSInteger)count
{
    return [UIImage xn_imagesWithBaseString:baseString beginIndex:1 endIndex:count];
}

+ (NSArray<UIImage *> *)xn_imagesWithBaseString:(NSString *)baseString
                          beginIndex:(NSInteger)beginIndex
                            endIndex:(NSInteger)endIndex
{
    NSMutableArray *imageArray = [[NSMutableArray alloc] init];
    for (NSInteger i = beginIndex; i <= endIndex; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%ld",baseString,i]];
        [imageArray addObject:image];
    }
    return imageArray;
}

+ (NSArray<UIImage *> *)xn_imagesWithBaseString:(NSString *)baseString
                          beginIndex:(NSInteger)beginIndex
                            endIndex:(NSInteger)endIndex
                               space:(NSInteger)space
{
    NSMutableArray *imageArray = [[NSMutableArray alloc] init];
    for (NSInteger i = beginIndex; i <= endIndex; i += space) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%ld",baseString,i]];
        [imageArray addObject:image];
    }
    return imageArray;
}

@end
