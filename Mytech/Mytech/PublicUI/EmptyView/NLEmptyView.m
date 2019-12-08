//
//  NLEmptyView.m
//  Voice
//
//  Created by zhuchangwei on 2018/9/23.
//  Copyright © 2018年 YANJING. All rights reserved.
//

#import "NLEmptyView.h"

@implementation NLEmptyView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createContentView];
    }
    return self;
}

- (void)createContentView {
    UIImageView *imageView = [[UIImageView alloc] init];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.width.equalTo(@(240 * kScaleX));
        make.height.equalTo(@(180 * kScaleX));
        make.centerY.equalTo(self.mas_centerY).offset(-42.5 * kScaleX);
    }];
    _iocnImageView = imageView;
    
//    UILabel *titleLabel = [VUnityManager v_createLabel:@"  " textColor:COLOR_BLACK_1 font:XNFont(16, FONT_TYPE_REGULAR)];
//    [self addSubview:titleLabel];
//    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self);
//        make.height.equalTo(@(22.5 * kScaleX));
//        make.top.equalTo(imageView.mas_bottom);
//    }];
//    _titleLabel = titleLabel;
//    
//    UILabel *detailLabel = [VUnityManager v_createLabel:@"  " textColor:UIColor.lv_black_3 font:XNFont(14, FONT_TYPE_REGULAR)];
//    [self addSubview:detailLabel];
//    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self);
//        make.height.equalTo(@(20 * kScaleX));
//        make.top.equalTo(titleLabel.mas_bottom).offset(6 * kScaleX);
//    }];
//    _detailLabel = detailLabel;
//    
//    UILabel * detailLabels = [VUnityManager v_createLabel:@"  " textColor:COLOR_BLACK_2 font:XNFont(14, FONT_TYPE_REGULAR)];
//    [self addSubview:detailLabels];
//    [detailLabels mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self);
//        make.height.equalTo(@(20 * kScaleX));
//        make.top.equalTo(detailLabel.mas_bottom).offset(4 * kScaleX);
//    }];
//    _detailLabels = detailLabels;
}

- (void)clickActionButton:(UIButton *)button {
    if (_clickButtonAction) {
        _clickButtonAction();
    }
}

- (void)xn_resetIconImageViewTopSpace:(CGFloat)top {
    CGFloat offsetY = self.mj_h / 2 - top - 90 * kScaleX;
   
    [_iocnImageView mas_updateConstraints:^(MASConstraintMaker *make) {
         make.centerY.equalTo(self).offset(-offsetY);
    }];
}

@end
