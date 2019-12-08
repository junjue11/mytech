//
//  NSMutableArray+Safe.m
//  XNArraySafe
//
//  Created by zhuchangwei on 2019/10/31.
//  Copyright © 2019 zhuchangwei. All rights reserved.
//

#import "NSMutableArray+Safe.h"
#import "Swzzling.h"

@implementation NSMutableArray (Safe)

#ifdef DEBUG

#else

+ (void)load{
     static dispatch_once_t onceToken;
       dispatch_once(&onceToken, ^{
           swizzling_exchangeMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndex:), @selector(xn_objectAtIndex:));
           swizzling_exchangeMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndexedSubscript:), @selector(xn_objectAtIndexedSubscript:));
           swizzling_exchangeMethod(objc_getClass("__NSArrayM"), @selector(removeObjectAtIndex:), @selector(xn_removeObjectAtIndex:));
           swizzling_exchangeMethod(objc_getClass("__NSArrayM"), @selector(removeObject:inRange:), @selector(xn_removeObject:inRange:));
           swizzling_exchangeMethod(objc_getClass("__NSArrayM"), @selector(replaceObjectAtIndex:withObject:), @selector(xn_replaceObjectAtIndex:withObject:));
           swizzling_exchangeMethod(objc_getClass("__NSArrayM"), @selector(removeObjectsInRange:), @selector(xn_removeObjectsInRange:));
           swizzling_exchangeMethod(objc_getClass("__NSArrayM"), @selector(replaceObjectsInRange:withObjectsFromArray:), @selector(xn_replaceObjectsInRange:withObjectsFromArray:));
           swizzling_exchangeMethod(objc_getClass("__NSArrayM"), @selector(insertObject:atIndex:), @selector(xn_insertObject:atIndex:));
           swizzling_exchangeMethod(objc_getClass("__NSArrayM"), @selector(addObject:), @selector(xn_addObject:));
       });
}

#endif

- (id)xn_objectAtIndex:(NSUInteger)index{
    if(index < self.count){
        return [self xn_objectAtIndex:index];
    }
    return nil;
}

- (id)xn_objectAtIndexedSubscript:(NSUInteger)index{
    if(index < self.count){
        return [self xn_objectAtIndex:index];
    }
    return nil;
}

- (void)xn_removeObjectAtIndex:(NSUInteger)index {
    if (index < self.count) {
        [self xn_removeObjectAtIndex:index];
    }
}

- (void)xn_removeObject:(id)anObject inRange:(NSRange)range {
    if (range.location + range.length > self.count) {
        return;
    }
    if (!anObject) {
        return;
    }
    [self xn_removeObject:anObject inRange:range];
}

- (void)xn_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (index >= self.count) {
        return;
    }
    if (!anObject) {
        return;
    }
    [self xn_replaceObjectAtIndex:index withObject:anObject];
}


- (void)xn_removeObjectsInRange:(NSRange)range {
    if (range.location + range.length > self.count) {
        return;
    }
    [self xn_removeObjectsInRange:range];
}

- (void)xn_replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray {
    if (range.location + range.length > self.count) {
        return;
    }
    if (!otherArray) {
        return;
    }
    [self xn_replaceObjectsInRange:range withObjectsFromArray:otherArray];
}

- (void)xn_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject == nil || index > self.count) {
           return;
       }
       [self xn_insertObject:anObject atIndex:index];
}

- (void)xn_addObject:(id)anObject {
    if (anObject == nil) {
        return;
    }
    [self xn_addObject:anObject];
}

@end
