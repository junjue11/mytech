//
//  UIView+Convenient.m
//  Mytech
//
//  Created by 周峻觉 on 2019/3/7.
//  Copyright © 2019年 周峻觉. All rights reserved.
//

#import "UIView+Convenient.h"

@implementation UIView (Convenient)

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}


- (CGFloat)top {
    return self.frame.origin.y;
}


- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}


- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}


- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}


- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}


- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}


- (CGFloat)centerX {
    return self.center.x;
}


- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}


- (CGFloat)centerY {
    return self.center.y;
}


- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}


- (CGFloat)width {
    return self.frame.size.width;
}


- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (CGFloat)height {
    return self.frame.size.height;
}


- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


- (CGPoint)origin {
    return self.frame.origin;
}


- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}


- (CGSize)size {
    return self.frame.size;
}


- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)originX
{
    return self.frame.origin.x;
}

- (void)setOriginX:(CGFloat)originX
{
    [self setOrigin:CGPointMake(originX, self.frame.origin.y)];
}

- (CGFloat)originY
{
    return self.frame.origin.y;
}

- (void)setOriginY:(CGFloat)originY
{
    [self setOrigin:CGPointMake(self.frame.origin.x, originY)];
}

- (CGPoint)leftTop {
    return CGPointMake(self.originX, self.originY);
}

- (void)setLeftTop:(CGPoint)leftTo {
    self.frame = CGRectMake(leftTo.x, leftTo.y, self.size.width, self.size.height);
}

- (CGPoint)rightTop {
    return CGPointMake(self.originX + self.size.width, self.originY);
}

- (void)setRightTop:(CGPoint)rightTop {
    self.frame = CGRectMake(rightTop.x - self.size.width, rightTop.y, self.size.width, self.size.height);
}

- (CGPoint)leftBottom {
    return CGPointMake(self.originX, self.originY + self.size.height);
}

- (void)setLeftBottom:(CGPoint)leftBottom {
    self.frame = CGRectMake(leftBottom.x, leftBottom.y - self.size.height, self.size.width, self.size.height);
}

- (CGPoint)rightBottom {
    return CGPointMake(self.originX + self.size.width, self.originY + self.size.height);
}

- (void)setRightBottom:(CGPoint)rightBottom {
    self.frame = CGRectMake(rightBottom.x - self.size.width, rightBottom.y - self.size.height, self.size.width, self.size.height);
}

- (BOOL)isVisible
{
    return !self.isHidden;
}

- (void)setVisible:(BOOL)visible
{
    self.hidden = !visible;
}

@end
