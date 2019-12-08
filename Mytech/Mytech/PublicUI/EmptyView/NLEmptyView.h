//
//  NLEmptyView.h
//  Voice
//
//  Created by zhuchangwei on 2018/9/23.
//  Copyright © 2018年 YANJING. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NLEmptyView : UIView

@property (weak, nonatomic) UIImageView *iocnImageView;
@property (weak, nonatomic) UILabel *titleLabel;
@property (weak, nonatomic) UILabel *detailLabel;
@property (weak, nonatomic) UIButton *actionButton;
@property (weak, nonatomic) UILabel *detailLabels;

@property (weak, nonatomic) void(^clickButtonAction)(void);

// 设置图片的位置
- (void)xn_resetIconImageViewTopSpace:(CGFloat)top;

@end
