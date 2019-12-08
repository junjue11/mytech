//
//  NSArray+XNFactory.h
//  AidouPeipei
//
//  Created by zhoujunnjue on 2019/11/12.
//  Copyright © 2019 zhoujunnjue. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (XNFactory)


/// 图片数组
/// @param baseString 名字前缀
/// @param beginIndex 开始编号
/// @param endIndex 结束编号
+ (NSArray *)createImageArrayWithBaseString:(NSString *)baseString
                                 beginIndex:(NSInteger)beginIndex
                                   endIndex:(NSInteger)endIndex;

@end

NS_ASSUME_NONNULL_END
