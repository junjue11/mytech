//
//  VerticalButton.m
//  LiangFengYouXin
//
//  Created by 周峻觉 on 16/5/19.
//  Copyright © 2016年 周峻觉. All rights reserved.
//

#import "VLButton.h"

static CGFloat kImageScale = 0.70f;

@implementation VLButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initDefaultTextAttr];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initDefaultTextAttr];
    }
    return self;
}

- (void) initDefaultTextAttr
{
    // 设置文字字体大小
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    // 设置文字居中
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.lineBreakMode = NSLineBreakByClipping;
    //
    self.imageView.layer.cornerRadius = 13;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
}

// 调整文字的frame  contentRect：button的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat pointX = -(contentRect.size.width*0.5);
    CGFloat pointY = contentRect.size.height * kImageScale;
    CGFloat width = contentRect.size.width;
    CGFloat height = contentRect.size.height * (1 - kImageScale);
    return CGRectMake(pointX, pointY, width*2, height);
}

// 调整图片的frame  contentRect：button的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat width = MIN(contentRect.size.width, contentRect.size.height * kImageScale);
    CGFloat height = MIN(contentRect.size.width, contentRect.size.height * kImageScale);
    CGFloat pointX = (self.frame.size.width - width) / 2;
    CGFloat pointY = 0;
    return CGRectMake(pointX, pointY, width, height);
}

@end
