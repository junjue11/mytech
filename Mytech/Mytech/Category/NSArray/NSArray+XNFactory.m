//
//  NSArray+XNFactory.m
//  AidouPeipei
//
//  Created by zhoujunnjue on 2019/11/12.
//  Copyright © 2019 zhoujunnjue. All rights reserved.
//

#import "NSArray+XNFactory.h"

@implementation NSArray (XNFactory)

+ (NSArray *)createImageArrayWithBaseString:(NSString *)baseString
                                 beginIndex:(NSInteger)beginIndex
                                   endIndex:(NSInteger)endIndex
{
    NSMutableArray *imageArray = [[NSMutableArray alloc] init];
    for (NSInteger i = beginIndex; i <= endIndex; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%ld",baseString,i]];
        [imageArray addObject:image];
    }
    return [imageArray copy];
}

@end
