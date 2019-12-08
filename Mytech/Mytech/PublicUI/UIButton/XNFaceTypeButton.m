//
//  XNFaceTypeButton.m
//  AidouPeipei
//
//  Created by zhoujunnjue on 2019/11/20.
//  Copyright © 2019 zhoujunnjue. All rights reserved.
//

#import "XNFaceTypeButton.h"

@interface XNFaceTypeButton()

@property (nonatomic, assign) CGFloat imageScale;

@end

@implementation XNFaceTypeButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageScale = 1.0;
    }
    return self;
}

- (void)updateAppearance
{
    if (self.selected) {
        _imageScale = 1.1;
    } else {
        _imageScale = 1.0;
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

// 调整文字的frame  contentRect：button的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect rect = [super titleRectForContentRect:contentRect];
    return rect;
}

// 调整图片的frame  contentRect：button的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGRect rect = [super imageRectForContentRect:contentRect];
    CGFloat w = rect.size.width * _imageScale;
    CGFloat h = rect.size.height * _imageScale;
    CGFloat x = (contentRect.size.width - w) * 0.5;
    CGFloat y = rect.origin.y - (h - rect.size.height);
    return CGRectMake(x, y, w, h);
}

@end
