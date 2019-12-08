//
//  NSNull+Safe.m
//  nullable
//
//  Created by vincent on 16/3/7.
//  Copyright © 2016年 vincent. All rights reserved.
//

#import "NSNull+Safe.h"

@implementation NSNull (Safe)

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    //look up method signature
    NSMethodSignature *signature = [super methodSignatureForSelector:selector];
    if (!signature)
    {
        for (Class someClass in @[
                                  [NSMutableArray class],
                                  [NSMutableDictionary class],
                                  [NSMutableString class],
                                  [NSNumber class],
                                  [NSDate class],
                                  [NSData class]
                                  ])
        {
            @try
            {
                if ([someClass instancesRespondToSelector:selector])
                {
                    signature = [someClass instanceMethodSignatureForSelector:selector];
                    break;
                }
            }
            @catch (__unused NSException *unused) {}
        }
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    invocation.target = nil;
    [invocation invoke];
}

- (NSInteger)integerValue {
    return 0;
}

- (long long)longLongValue {
    return 0;
}

- (double)doubleValue {
    return 0.0;
}

- (int)intValue {
    return 0;
}

- (long)longValue {
    return 0;
}

- (BOOL)boolValue {
    return NO;
}

@end
