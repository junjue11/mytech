//
//  XNRedPointButton.m
//  AidouPeipei
//
//  Created by zhoujunnjue on 2019/11/15.
//  Copyright © 2019 zhoujunnjue. All rights reserved.
//

#import "XNRedPointButton.h"

@interface XNRedPointButton()

@property (nonatomic, strong) UILabel *redPointLabel;

@end

@implementation XNRedPointButton

- (instancetype)initWithFrame:(CGRect)frame redPointImage:(UIImage *)image redPointFont:(UIFont *)font
{
    self = [self initWithFrame:frame];
    if (self) {
        self.redPointImage = image;
        self.redPointFont = font;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.redPointLabel];
    }
    return self;
}

- (void)showRedPoint:(NSString *)text
{
    if (text == nil) {
        self.redPointLabel.size = CGSizeMake(6 * kScaleX, 6 * kScaleX);
        self.redPointLabel.layer.cornerRadius = 3 * kScaleX;
        self.redPointLabel.layer.masksToBounds = YES;
        self.redPointLabel.backgroundColor = UIColorHex(#FF715B);
        
        self.redPointLabel.text = nil;
        
        self.redPointLabel.top = 0;
        self.redPointLabel.right = self.width;
    } else {
        self.redPointLabel.size = CGSizeMake(20 * kScaleX, 20 * kScaleX);
        UIColor *color = [UIColor colorWithPatternImage:self.redPointImage];
        self.redPointLabel.backgroundColor = color;
        self.redPointLabel.font = self.redPointFont;
//        self.redPointLabel.text = XNSafeString(text); TODO
        
        self.redPointLabel.center = CGPointMake(self.width - 1 * kScaleX, 3 * kScaleX);
    }
    self.redPointLabel.hidden = NO;
}

- (void)hideRedPoint
{
    self.redPointLabel.hidden = YES;
}

#pragma mark - getter & setter
- (UILabel *)redPointLabel
{
    if (!_redPointLabel) {
        _redPointLabel = [[UILabel alloc] init];
        _redPointLabel.textAlignment = NSTextAlignmentCenter;
        _redPointLabel.textColor = UIColorHex(#FFFFFF);
        _redPointLabel.hidden = YES;
    }
    return _redPointLabel;
}

@end
