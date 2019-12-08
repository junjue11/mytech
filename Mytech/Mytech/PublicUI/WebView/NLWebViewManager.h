//
//  NLWebViewManager.h
//  LightVoice
//
//  Created by zhuchangwei on 2019/4/18.
//  Copyright © 2019年 xiaoniu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NLWebViewManager : NSObject

+ (NLWebViewManager *)shareWebViewManager;

/**
 * 获取已经备好的webView

 @return 已经备好的webView
 */
- (WKWebView *)lv_getWebView;

/**
 * 手动销毁已经使用的webView
 @param webView 需要销毁的webView
 */
- (void)lv_dellocWebview:(WKWebView *)webView;

@end

NS_ASSUME_NONNULL_END
