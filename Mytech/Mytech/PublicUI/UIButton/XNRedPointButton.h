//
//  XNRedPointButton.h
//  AidouPeipei
//
//  Created by zhoujunnjue on 2019/11/15.
//  Copyright © 2019 zhoujunnjue. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XNRedPointButton : UIButton

@property (nonatomic, strong) UIImage *redPointImage;
@property (nonatomic, strong) UIFont *redPointFont;

- (instancetype)initWithFrame:(CGRect)frame redPointImage:(UIImage * _Nullable)image redPointFont:(UIFont * _Nullable)font;


/// 显示红点
/// @param text 为nil是，显示单纯的红点；不为nil时，显示带有文字的红点。
- (void)showRedPoint:(NSString * _Nullable)text;
- (void)hideRedPoint;

@end

NS_ASSUME_NONNULL_END
