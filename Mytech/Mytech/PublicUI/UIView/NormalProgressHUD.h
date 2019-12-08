//
//  NormalProgressHUD.h
//  CalfSports
//
//  Created by 周结兵 on 2017/12/12.
//  Copyright © 2017年 宏鹿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NormalProgressHUD : NSObject

+ (instancetype)sharedInstance;

/**
 loading框显示
 */
- (void)showLoading;

/**
 加载框

 @param isClear 是不是透明的
 */
- (void)showLoadingWithIsClear:(BOOL)isClear;

/**
 loading框消失
 */
- (void)dismiss;

/**
 展示tips信息 会根据信息内容设置具体大小

 @param message 信息
 */
- (void)showMessage:(NSString *)message;


/// 版本更新弹窗
/// @param callBack 是否展示弹窗回调
/// @param dismissBlock 弹窗消失回调
- (void)public_showUpdateWindowWithCallBack:(void(^)(BOOL isShowWindow))callBack dismissBlock:(void(^)(void))dismissBlock;

@end
