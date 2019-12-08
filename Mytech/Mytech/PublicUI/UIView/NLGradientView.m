//
//  NLGradientView.m
//  LightVoice
//
//  Created by zhoujiebing on 2018/10/19.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import "NLGradientView.h"

@interface NLGradientView ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) UIView *enbleView;

@end

@implementation NLGradientView

#pragma mark - ♻️life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer addSublayer:self.gradientLayer];
        [self addSubview:self.enbleView];
    }
    return self;
}

#pragma mark - 🎬event response

#pragma mark - ☸getter and setter

- (void)layoutSubviews {
    self.gradientLayer.frame = self.bounds;
    self.enbleView.frame = self.bounds;
    //设置渐变区域的起始和终止位置（范围为0-1）
    if (self.isOwnDefinition) {
        self.gradientLayer.startPoint = self.startPoint;
        self.gradientLayer.endPoint = self.endPoint;
        self.gradientLayer.colors = @[(__bridge id)self.statrColor.CGColor,
                                      (__bridge id)self.endColor.CGColor];
    } else {
        self.gradientLayer.startPoint = CGPointMake(0, 0);
        self.gradientLayer.endPoint = CGPointMake(1, 0);
        //        self.gradientLayer.colors = @[(__bridge id)UIColorFromRGB(0xf63875).CGColor,
        //                                      (__bridge id)UIColorFromRGB(0xf9603c).CGColor];
        self.gradientLayer.colors = @[(__bridge id)UIColorHex(#FF6021).CGColor,
                                      (__bridge id)UIColorHex(#FF1A89).CGColor,
                                      (__bridge id)UIColorHex(#BE0EFF).CGColor];
    }
    //设置颜色分割点（范围：0-1）
    self.gradientLayer.locations = @[@(0.0f), @(0.5f), @(1.0f)];
}

- (void)setIsEnbled:(BOOL)isEnbled {
    self.enbleView.hidden = isEnbled;
}

- (CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [[CAGradientLayer alloc]init];
    }
    return _gradientLayer;
}

- (UIView *)enbleView {
    if (!_enbleView) {
        _enbleView = [[UIView alloc]init];
        _enbleView.backgroundColor = [UIColor whiteColor];
        _enbleView.alpha = 0.7;
        _enbleView.hidden = YES;
    }
    return _enbleView;
}

@end
