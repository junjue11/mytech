//
//  NormalProgressHUD.m
//  CalfSports
//
//  Created by 周结兵 on 2017/12/12.
//  Copyright © 2017年 宏鹿. All rights reserved.
//

#import "NormalProgressHUD.h"
#import "NLUpGradeWindowView.h"

@interface NormalProgressHUD ()

@property (nonatomic, strong) UIView *loadView;
@property (nonatomic, strong) UIImageView *loadImageView;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) NSArray *animationArray;
@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, assign) BOOL isLoading;


@end

@implementation NormalProgressHUD

+ (instancetype)sharedInstance
{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)showLoading {
    [self showLoadingWithIsClear:NO];
}

- (void)showLoadingWithIsClear:(BOOL)isClear {
    if (self.isLoading) {
        return;
    }
    self.isLoading = YES;
    self.loadImageView.hidden = YES;
    [self.window addSubview:self.loadView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (isClear) {
            self.loadImageView.hidden = YES;
        } else {
            if (self.isLoading) {
                self.loadImageView.hidden = NO;
                [self.loadImageView startAnimating];
            }
        }
    });
}

- (void)dismiss
{
    if (!self.isLoading) {
        return;
    }
    self.isLoading = NO;
    self.loadImageView.hidden = YES;
    [self.loadImageView stopAnimating];
    [self.loadView removeFromSuperview];
}

- (void)showMessage:(NSString *)message
{
    if (message.length > 0)
    {
        self.messageLabel.text = message;
        self.messageLabel.font = [UIFont systemFontOfSize:14];
        CGSize size = [self stringRectWithStr:message];
        UIView *blackView = [[UIView alloc] init];
        blackView.backgroundColor = [UIColor colorWithRGB:0x262626 alpha:0.5];
        blackView.clipsToBounds= YES;
        [self.window addSubview:self.backView];
        [self.backView addSubview:blackView];
        [self.backView addSubview:self.messageLabel];
        blackView.frame = CGRectMake(0, 0, size.width + 20*kScaleX, size.height + 20*kScaleX);
        blackView.center = CGPointMake(kScreenWidth/2.0, kScreenHeight/2.0 - 50*kScaleX);
        blackView.layer.cornerRadius = MIN(blackView.mj_h / 2, 40 * kScaleX);
        self.messageLabel.frame = CGRectMake(0, 0, size.width, size.height);
        self.messageLabel.center = CGPointMake(kScreenWidth/2.0, kScreenHeight/2.0 - 50*kScaleX);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.backView removeAllSubviews];
            [self.backView removeFromSuperview];
        });
    }
    else
    {
//        XNLog(@"传进来的message是空值,请检查!"); // TODO
    }
}

/**
 根据字符串内容计算出label需要的大小
 
 @param str 字符串
 @return label的大小
 */
- (CGSize)stringRectWithStr:(NSString *)str
{
    self.messageLabel.text = str;
    CGSize size = [self.messageLabel sizeThatFits:CGSizeMake(kScreenWidth - 44*kScaleX, kScreenHeight*kScaleX)];
    return size;
}

- (void)public_showUpdateWindowWithCallBack:(void(^)(BOOL isShowWindow))callBack dismissBlock:(void(^)(void))dismissBlock {
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//    [XNHelper xDic:dic setObj:@"7201" forKey:@"appType"];
//    [XNHelper xDic:dic setObj:@"1" forKey:@"versionType"];//1-生产 2-预发布 3-测试
//    [[HttpTool shareInstance] requestWithBaseUrl:BASE_URL_USER urlStr:@"userwar/appVersion/query" method:@"POST" parameters:dic success:^(id resultObj) {
//        NSString *forcedUpdate = [XNHelper stringForValue:resultObj[@"forcedUpdate"]];
//        NSString *version = [[XNHelper stringForValue:resultObj[@"versionNumber"]] stringByReplacingOccurrencesOfString:@"." withString:@""];
//        NSString *orginVersion = [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
//        orginVersion = [orginVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
//        NSString *changeDesc = [XNHelper stringForValue:resultObj[@"changeDesc"]];
//        NSString *downloadUrl = [XNHelper stringForValue:resultObj[@"downloadUrl"]];
//        if (version.integerValue > orginVersion.integerValue && downloadUrl.length > 0) {
//            if (forcedUpdate.integerValue == 1) {
//                UIWindow *window = [UIApplication sharedApplication].keyWindow;
//                NLUpGradeWindowView *upGradeView = [[NLUpGradeWindowView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//                [upGradeView public_updateVersion:[XNHelper stringForValue:resultObj[@"versionNumber"]] desStr:changeDesc linkUrl:downloadUrl isForceUpdate:forcedUpdate.integerValue == 1 dismissBlock:dismissBlock];
//                [window addSubview:upGradeView];
//                callBack(YES);
//            } else {
//                if ([NSString stringWithFormat:@"userSelectShowWindow%@",[XNHelper stringForValue:resultObj[@"versionNumber"]]]) {
//                    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//                    NLUpGradeWindowView *upGradeView = [[NLUpGradeWindowView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//                    [upGradeView public_updateVersion:[XNHelper stringForValue:resultObj[@"versionNumber"]] desStr:changeDesc linkUrl:downloadUrl isForceUpdate:forcedUpdate.integerValue == 1 dismissBlock:dismissBlock];
//                    [window addSubview:upGradeView];
//                    callBack(YES);
//                } else {
//                    callBack(NO);
//                }
//            }
//        } else {
//            callBack(NO);
//        }
//    } fail:^(NSString *errorStr) {
//        callBack(NO);
//    }];
}

#pragma mark - ☸getter and setter

- (UIWindow *)window
{
    if (!_window)
    {
        _window = [UIApplication sharedApplication].keyWindow;
    }
    return _window;
}

- (UIView *)loadView
{
    if (!_loadView)
    {
        _loadView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _loadView.backgroundColor = [UIColor clearColor];//RGBAlphaColor(0x000000, 0.5);
        self.loadImageView.frame = CGRectMake(0, 0, 150*kScaleX, 100*kScaleX);
        self.loadImageView.center = CGPointMake(kScreenWidth/2.0, kScreenHeight/2.0);
        [_loadView addSubview:self.loadImageView];
    }
    return _loadView;
}

- (UILabel *)messageLabel
{
    if (!_messageLabel)
    {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.numberOfLines = 0;
        _messageLabel.textColor = [UIColor whiteColor];
//        _messageLabel.font = [UIFont regularFontWithSize:16*kScaleX]; // TODO
        _messageLabel.clipsToBounds = true;
    }
    return _messageLabel;
}

- (UIImageView *)loadImageView
{
    if (!_loadImageView)
    {
        _loadImageView = [[UIImageView alloc]init];
        _loadImageView.animationImages = self.animationArray;
        _loadImageView.animationDuration = 1;
        _loadImageView.animationRepeatCount = 0;
    }
    return _loadImageView;
}

- (UIView *)backView
{
    if (!_backView)
    {
        _backView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backView.backgroundColor = [UIColor clearColor];
    }
    return _backView;
}

- (NSArray *)animationArray
{
    if (!_animationArray)
    {
        NSMutableArray *imageArray = [[NSMutableArray alloc] init];
        for (NSInteger i = 1; i < 13; i++) {
            NSString *name = [NSString stringWithFormat:@"yami_load_%zd", i];
            [imageArray addObject:XNImage(name)];
        }
        _animationArray = imageArray;
        
    }
    return _animationArray;
}
@end
