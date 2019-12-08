//
//  NSNull+Safe.h
//  nullable
//
//  Created by vincent on 16/3/7.
//  Copyright © 2016年 vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNull (Safe)

- (NSInteger)integerValue;

- (long long)longLongValue;

- (double)doubleValue;

- (int)intValue;

- (long)longValue;

- (BOOL)boolValue;

@end
