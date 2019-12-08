//
//  BKQShareView.m
//  BKQ
//
//  Created by 周峻觉 on 2019/6/27.
//  Copyright © 2019 周峻觉. All rights reserved.
//

#import "BKQShareView.h"
#import "LXMethod.h"
#import "BKQShareTool.h"
#import <WechatOpenSDK/WXApi.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <Weibo_SDK/WeiboSDK.h>

@interface BKQShareView()<BKQShareBoxDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong)BKQShareBox *actionView;

@end

@implementation BKQShareView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:kScreenBounds];
    if (self) {
        self.backgroundColor = RGB(102, 102, 102);
        
        // 设置点击手势
        [self setupTapGesture];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)setupTapGesture {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapGesture:)];
    tapGesture.delegate = self;
    [self addGestureRecognizer:tapGesture];
}

- (void)show {
    
    [kKeyWindow addSubview:self];
    [UIView animateWithDuration:0.3 animations:^{
        self.actionView.top = kScreenHeight - self.actionView.height;
    }];
    
}

- (void)close {
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0 alpha: 0];
        self.top = kScreenHeight;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


- (void)onTapGesture:(UIGestureRecognizer *)tap {
    [self close];
}

#pragma mark - BKQShareBoxDelegate
- (void)shareSheet:(BKQShareBox *)sheet action:(BKQSharePlatform)action {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self close];
    });
    
}

- (void)shareSheetShouldClose:(BKQShareBox *)sheet {
    [self close];
}

#pragma mark - getter & setter
- (BKQShareBox *)actionView
{
    if (!_actionView) {
        _actionView = [[BKQShareBox alloc] initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth, 200)];
        _actionView.delegate = self;
        [self addSubview:_actionView];
    }
    return _actionView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
