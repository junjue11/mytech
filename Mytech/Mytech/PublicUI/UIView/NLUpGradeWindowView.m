//
//  NLUpGradeWindowView.m
//  LightVoice
//
//  Created by zhoujiebing on 2018/11/2.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import "NLUpGradeWindowView.h"
#import "NLGradientView.h"

@interface NLUpGradeWindowView ()

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIImageView *upImageView;
@property (nonatomic, strong) UIButton *upGradButton;
@property (nonatomic, strong) UIButton *deleteButton;
@property (nonatomic, strong) UILabel *vsionLabel;
@property (nonatomic, strong) UILabel *desStrLabel;
@property (nonatomic, copy) NSString *linkUrl;
@property (nonatomic, copy) NSString *version;
@property (nonatomic, strong) void(^dismissBlock)(void);//消失的回调

@end

@implementation NLUpGradeWindowView

#pragma mark - ♻️life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRGB:0x000000 alpha:0.4];
    }
    return self;
}

- (void)initSubViewsWithVersion:(NSString *)version desStr:(NSString *)desStr isForceUpdate:(BOOL)isForceUpdate{
    
//    [self addSubview:self.backView];
//    [self.backView addSubview:self.upImageView];
//    [self.backView addSubview:self.vsionLabel];
//    [self.backView addSubview:self.upGradButton];
//
//
//    NSArray *titleArray = [desStr componentsSeparatedByString:@";"];
//    CGFloat topH = 14*kScaleX;
//    if (titleArray.count > 0) {
//        for (NSInteger i = 0; i < titleArray.count; i++) {
//            NSString *string = titleArray[i];
//            CGFloat strH = [XNHelper help_heightForString:string font:[UIFont regularFontWithSize:14] width:234*kScaleX];
//            UILabel *strLabel = [UILabel new];
//            [self.backView addSubview:strLabel];
//            [strLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.left.equalTo(self.upImageView).offset(28*kScaleX);
//                make.right.equalTo(self.upImageView).offset(-28*kScaleX);
//                make.top.equalTo(self.upImageView.mas_bottom).offset(topH);
//            }];
//            strLabel.numberOfLines = 0;
//            strLabel.cp_font([UIFont regularFontWithSize:14]).cp_text(string).cp_textColor(COLOR_BLACK_1).cp_alignment(NSTextAlignmentLeft);
//            topH += strH + 5;
//        }
//    }
//
//    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self);
//        make.size.mas_equalTo(CGSizeMake(290*kScaleX, 228*kScaleX + topH));
//    }];
//    [self.upImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.backView);
//        make.top.equalTo(self.backView).offset(-1);
//        make.size.mas_equalTo(CGSizeMake(290*kScaleX, 150*kScaleX));
//    }];
//
//    [self.vsionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.backView);
//        make.top.equalTo(self.backView).offset(68*kScaleX);
//    }];
//
//    [self.upGradButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.backView);
//        make.bottom.equalTo(self.backView).offset(-28*kScaleX);
//        make.size.mas_equalTo(CGSizeMake(234*kScaleX, 44*kScaleX));
//    }];
//
//    if (!isForceUpdate) {
//        [self addSubview:self.deleteButton];
//        [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(self.backView);
//            make.top.equalTo(self.backView.mas_bottom).offset(30*kScaleX);
//            make.size.mas_equalTo(CGSizeMake(30*kScaleX, 30*kScaleX));
//        }];
//        self.deleteButton.cp_imageName(@"delete_icon").cp_action(self,@selector(clickAction_dismiss));
//    }
//    self.backView.backgroundColor = [UIColor whiteColor];
//    self.backView.layer.cornerRadius = 6*kScaleX;
//    self.backView.clipsToBounds = YES;
//    NLGradientView *gradView = [[NLGradientView alloc] initWithFrame:CGRectMake(0, 0, 234*kScaleX, 44*kScaleX)];
//    self.upGradButton.cp_backImage([XNHelper createViewImage:gradView]).cp_title(@"立即升级").cp_action(self,@selector(clickAction_upGrade)).cp_cornerRadius(22*kScaleX).cp_clipsToBounds(YES);
//
//    self.vsionLabel.cp_text(version).cp_font([UIFont mediumFontWithSize:16]).cp_textColor(ColorFromRGB(0xffffff)).cp_alignment(NSTextAlignmentCenter);
//    self.backView.transform = CGAffineTransformMakeScale(0.6, 0.6);
//    [UIView animateWithDuration: 0.8 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0.4 options:0 animations:^{
//        // 放大
//        self.backView.transform = CGAffineTransformMakeScale(1, 1);
//    } completion:nil];
}

- (void)public_updateVersion:(NSString *)version desStr:(NSString *)desStr linkUrl:(NSString *)linkUrl isForceUpdate:(BOOL)isForceUpdate dismissBlock:(void(^)(void))dismissBlock {
//    if (dismissBlock) {
//        self.dismissBlock = dismissBlock;
//    }
//    self.linkUrl = linkUrl;
//    self.version = version;
//    [self initSubViewsWithVersion:version desStr:desStr isForceUpdate:(BOOL)isForceUpdate];
}
#pragma mark - 🎬event response

- (void)clickAction_upGrade {
    if (self.linkUrl.length > 0) {
        NSURL *loadUrl = [NSURL URLWithString:self.linkUrl];
        [[UIApplication sharedApplication] openURL:loadUrl];
    } else {
//        [XNProgressHUD showMessage:@"链接无效"]; // TODO
    }
}

- (void)clickAction_dismiss {
    [[NSUserDefaults standardUserDefaults] setObject:@"我想你" forKey:[NSString stringWithFormat:@"userSelectShowWindow%@",self.version]];
    [UIView animateWithDuration:0.2 animations:^{
        self.backView.transform = CGAffineTransformMakeScale(0.7, 0.7);
        self.backView.alpha = 0;
    } completion:^(BOOL finished) {
        self.backView.alpha = 1;
        if (self.dismissBlock) {
            self.dismissBlock();
        }
        [self removeFromSuperview];
    }];
}

#pragma mark - ☸getter and setter

- (UIImageView *)upImageView {
    if (!_upImageView) {
        _upImageView = [[UIImageView alloc] init];
        _upImageView.image = [UIImage imageNamed:@"public_upgrade"];
    }
    return _upImageView;
}

- (UIButton *)upGradButton {
    if (!_upGradButton) {
        _upGradButton = [[UIButton alloc] init];
    }
    return _upGradButton;
}

- (UILabel *)desStrLabel {
    if (!_desStrLabel) {
        _desStrLabel = [[UILabel alloc] init];
    }
    return _desStrLabel;
}

- (UILabel *)vsionLabel {
    if (!_vsionLabel) {
        _vsionLabel = [[UILabel alloc] init];
    }
    return _vsionLabel;
}

- (UIButton *)deleteButton {
    if (!_deleteButton) {
        _deleteButton = [[UIButton alloc] init];
    }
    return _deleteButton;
}

- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor colorWithRGB:0x000000 alpha:0.4];
    }
    return _backView;
}

@end
