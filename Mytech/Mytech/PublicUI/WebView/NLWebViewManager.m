//
//  NLWebViewManager.m
//  LightVoice
//
//  Created by zhuchangwei on 2019/4/18.
//  Copyright © 2019年 xiaoniu. All rights reserved.
//

#import "NLWebViewManager.h"

@interface NLWebViewManager ()

@property (strong, nonatomic) NSMutableArray *webviewArray;

@end

@implementation NLWebViewManager

+ (NLWebViewManager *)shareWebViewManager {
    static NLWebViewManager *webviewManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        webviewManager = [[NLWebViewManager alloc] init];
    });
    return webviewManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
//        NSString *customUserAgent = [XNHelper help_publicStr];
//        [[NSUserDefaults standardUserDefaults] registerDefaults:@{@"UserAgent":customUserAgent}];
        [self p_createWebView:YES];
    }
    return self;
}

/**
 * 获取已经备好的webView
 
 @return 已经备好的webView
 */
- (WKWebView *)lv_getWebView {
   WKWebView *webView  = self.webviewArray.firstObject;
    if (webView) {
        [self.webviewArray removeObjectAtIndex:0];
        // 重新创建备用WebView
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self p_createWebView:YES];
        });
    } else {
        webView = [self p_createWebView:NO];
    }
    return webView;
}

/**
 * 手动销毁已经使用的webView
 @param webView 需要销毁的webview
 */
- (void)lv_dellocWebview:(WKWebView *)webView {
    [self.webviewArray removeObject:webView];
    webView = nil;
    [self p_checkHasSpareWebView];
}


#pragma mark - Private Method

/**
 * 检查是否有备用webView
 */
- (void)p_checkHasSpareWebView {
    if(self.webviewArray.count == 0){
        [self p_createWebView:YES];
    }
}

/**
 * 创建备用WebView
 @param preloading 是否需要预加载
 @return 备用WebView
 */
- (WKWebView *)p_createWebView:(BOOL)preloading {
    WKWebView *webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds configuration:[[WKWebViewConfiguration alloc] init]];
    webView.backgroundColor = [UIColor whiteColor];
    webView.scrollView.showsVerticalScrollIndicator = NO;
    webView.scrollView.showsHorizontalScrollIndicator = NO;
    webView.scrollView.bounces = NO;
    [webView setClearsContextBeforeDrawing:YES];
    if (@available(iOS 11.0, *)){
        if ([webView.scrollView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
            webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    if (preloading) {
//        NSString *url = [NSString stringWithFormat:@"%@static/html/preload.html", BASE_H5];
//        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
        [self.webviewArray addObject:webView];
    }
    return webView;
}

- (NSString *)xn_publicDataWithHtmlUrl:(NSString *)url {
    return url;
    NSString *newUrl = nil;
//    if ([url containsString:@"?"]) {
//        //拼接过参数
//        newUrl = [NSString stringWithFormat:@"%@&xn_data=%@",url,[XNHelper xn_data]];
//    }else{
//        //没有拼接过参数
//        newUrl = [NSString stringWithFormat:@"%@?xn_data=%@",url,[XNHelper xn_data]];
//    }
//    return newUrl;
}

#pragma mark - Gettter && Setter

- (NSMutableArray *)webviewArray {
    if (!_webviewArray) {
        _webviewArray = [[NSMutableArray alloc] init];
    }
    return _webviewArray;
}

@end
