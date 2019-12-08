//
//  NLGradientView.h
//  LightVoice
//
//  Created by zhoujiebing on 2018/10/19.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NLGradientView : UIView

@property (nonatomic, assign) BOOL isOwnDefinition;//是否自定义 如果自定义下面的开始点和结束点必须要设置
@property (nonatomic, strong) UIColor *statrColor;
@property (nonatomic, strong) UIColor *endColor;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;
@property (nonatomic, assign) BOOL isEnbled;//是否可点击的颜色

@end

NS_ASSUME_NONNULL_END
