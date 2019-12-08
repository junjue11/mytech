//
//  BKQShareBox.m
//  LiangFengYouXin
//
//  Created by 周峻觉 on 2017/8/10.
//  Copyright © 2017年 周峻觉. All rights reserved.
//

#import "BKQShareBox.h"
#import "WXApi.h"
#import "WeiboSDK.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import "VLButton.h"
#import "LXMethod.h"
#import "Config.h"

#define kButtonWidth        44
#define kButtonHeight       74

@interface ACButton : VLButton

@property(nonatomic, assign)BKQSharePlatform action;

@end

@implementation ACButton

@end

@interface BKQShareBox ()

@property(nonatomic, strong)NSMutableArray<ACButton *> *platformButtons;

@property(nonatomic, strong)UIButton *cancelButton;

@end

@implementation BKQShareBox

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addPlatformButtons];
        [self addSubview:self.cancelButton];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doNothing:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)addPlatformButtons
{
    for (UIView *v in self.platformButtons) {
        [self addSubview:v];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // y 坐标累计记录
    NSInteger yyy = 20;
    
    // 布局社交平台按钮
    NSInteger lineCount = self.platformButtons.count;
    NSInteger interval = (self.width-kButtonWidth*lineCount)/(lineCount+1);
    
    for (int i = 0; i < self.platformButtons.count; i++) {
        ACButton *btn = self.platformButtons[i];
        btn.top = yyy;
        btn.left = interval + i * (interval + kButtonWidth);
    }
    
    // 取消按钮
    self.cancelButton.width = self.width;
    self.cancelButton.height = 44;
    self.cancelButton.bottom = self.height;
    self.cancelButton.left = 0;
    
}

- (void)doNothing:(UITapGestureRecognizer *)gesture
{
    //
}

-(void)shareAction:(ACButton *)button
{
    if (_delegate && [_delegate respondsToSelector:@selector(shareBox:didSelectedPlatform:)]) {
        [_delegate shareBox:self didSelectedPlatform:button.action];
    }
    
    if ((button.action == BKQSharePlatformWechat ||
         button.action == BKQSharePlatformWechatFriends) &&
         [WXApi isWXAppInstalled] == NO) {
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"你未安装微信，无法进行分享，请下载安装最新版手机。" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [ac addAction:action];
        
        UIViewController *vc = [LXMethod findViewController:self];
        [vc presentViewController:ac animated:YES completion:nil];
    }
}

- (void)cancelAction:(UIButton *)button {
    if (_delegate && [_delegate respondsToSelector:@selector(shareBoxShouldClose:)]) {
        [_delegate shareBoxShouldClose:self];
    }
}

#pragma mark - getter和setter

- (UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc] init];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:RGB(25, 25, 25) forState:UIControlStateNormal];
        _cancelButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18];
        _cancelButton.backgroundColor = RGB(246, 246, 246);
        [_cancelButton addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

- (NSMutableArray<ACButton *> *)platformButtons {
    if (!_platformButtons) {
        
        NSArray *array = @[
            @{@"title": @"微信",@"imageName":@"icon_wechat.png", @"platform": @(BKQSharePlatformWechat)},
            @{@"title": @"朋友圈",@"imageName":@"icon_friends.png", @"platform": @(BKQSharePlatformWechatFriends)},
            @{@"title": @"QQ",@"imageName":@"icon_qq.png", @"platform": @(BKQSharePlatformQQ)},
            @{@"title": @"QQ空间",@"imageName":@"icon_qqspace.png", @"platform": @(BKQSharePlatformQQSpace)},
            @{@"title": @"微博",@"imageName":@"icon_weibo.png", @"platform": @(BKQSharePlatformWeibo)}
        ];
        
        _platformButtons = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            ACButton *button = [[ACButton alloc] initWithFrame:CGRectMake(0, 0, kButtonWidth, kButtonHeight)];
            [button setImage:[UIImage imageNamed:dict[@"imageName"]] forState:UIControlStateNormal];
            [button setTitle:dict[@"title"] forState:UIControlStateNormal];
            [button setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
            [button addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
            button.action = [dict[@"platform"] integerValue];
            
            [_platformButtons addObject:button];
        }
    }
    return _platformButtons;
}

@end


