//
//  BKQShareTool.m
//  BKQ
//
//  Created by 周峻觉 on 2019/4/17.
//  Copyright © 2019 周峻觉. All rights reserved.
//

#import "BKQShareTool.h"
#import "WXApi.h"
#import "WeiboSDK.h"
#import "UIImage+Extension.h"
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/QQApiInterfaceObject.h>

@implementation BKQShareTool

//分享文本到第三方平台，platform: "qq"  "qq.space" "weibo"  "wx.session"  "wx.timeline"
+ (void)shareWithText:(NSString *)text toPlatform:(NSString *)platform {
    [BKQShareTool shareWithText:text toPlatform:platform completion:nil];
}

+ (void)shareWithText:(NSString *)text toPlatform:(NSString *)platform completion:(void (^ _Nullable)(void))completion
{
    if ([@"qq" isEqualToString:[platform lowercaseString]] ||
        [@"qq.space" isEqualToString:[platform lowercaseString]]) {
        
        QQApiTextObject * txtObj = [QQApiTextObject objectWithText:text];
        SendMessageToQQReq * req = [SendMessageToQQReq reqWithContent:txtObj];
        if ([@"qq" isEqualToString:[platform lowercaseString]]) {
            [QQApiInterface sendReq:req];
        } else {
            [QQApiInterface SendReqToQZone:req];
        }
        
        if (completion) {
            completion();
        }
    } else if ([@"weibo" isEqualToString:[platform lowercaseString]]){
        WBMessageObject * message = [WBMessageObject message];
        message.text = text;

        WBSendMessageToWeiboRequest * request = [WBSendMessageToWeiboRequest requestWithMessage:message];
        //request.userInfo = nil;
        //request.shouldOpenWeiboAppInstallPageIfNotInstalled = NO;

        [WeiboSDK sendRequest:request];
        
        if (completion) {
            completion();
        }
    } else if ([@"wx.session" isEqualToString:[platform lowercaseString]] ||
               [@"wx.timeline" isEqualToString:[platform lowercaseString]]){
        
        SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
        req.text = text;
        req.bText = YES;
        if ([@"wx.session" isEqualToString:[platform lowercaseString]]) {
            req.scene = WXSceneSession;
        } else {
            req.scene = WXSceneTimeline;
        }
        [WXApi sendReq:req completion:^(BOOL success) {
            
        }];
        
        if (completion) {
            completion();
        }
    }
}

//分享图片到第三方平台，platform: "qq"  "weibo"  "wx.session"  "wx.timeline"
+ (void)shareWithImage:(UIImage *)image toPlatform:(NSString *)action {
    [BKQShareTool shareWithImage:image toPlatform:action completion:nil];
}

+ (void)shareWithImage:(UIImage *)image toPlatform:(NSString *)platform completion:(void (^ _Nullable)(void))completion
{
    
    if ([@"qq" isEqualToString:[platform lowercaseString]] ||
        [@"qq.space" isEqualToString:[platform lowercaseString]]) {
        NSData* preImgData = UIImageJPEGRepresentation(image, 0.3);;
        NSData * imgData = UIImageJPEGRepresentation(image, 0.3);
        
        if ([@"qq" isEqualToString:[platform lowercaseString]]) {
            QQApiImageObject * imgObj = [QQApiImageObject objectWithData:imgData
                                                        previewImageData:preImgData
                                                                   title:nil
                                                             description:nil];
            SendMessageToQQReq * req = [SendMessageToQQReq reqWithContent:imgObj];
            [QQApiInterface sendReq:req];
        } else {
            QQApiImageArrayForQZoneObject *img = [QQApiImageArrayForQZoneObject objectWithimageDataArray:@[imgData] title:nil extMap:nil];
            SendMessageToQQReq* req = [SendMessageToQQReq reqWithContent:img];
            [QQApiInterface SendReqToQZone:req];
        }
        
        if (completion) {
            completion();
        }
    } else if ([@"weibo" isEqualToString:[platform lowercaseString]]){
        
        WBImageObject * img = [WBImageObject object];
        img.imageData = UIImageJPEGRepresentation(image, 0.4);

        WBMessageObject * message = [WBMessageObject message];
        message.imageObject = img;

        WBSendMessageToWeiboRequest * request = [WBSendMessageToWeiboRequest requestWithMessage:message];
        //request.userInfo = nil;
//        request.shouldOpenWeiboAppInstallPageIfNotInstalled = NO;
        
//        WBAuthorizeRequest *auth = [[WBAuthorizeRequest alloc] init];
//        auth.redirectURI = @"https://api.weibo.com/oauth2/default.html";
//        auth.shouldShowWebViewForAuthIfCannotSSO = NO;
//        WBSendMessageToWeiboRequest * request = [WBSendMessageToWeiboRequest requestWithMessage:message authInfo:auth access_token:nil];
//        request.shouldOpenWeiboAppInstallPageIfNotInstalled = NO;

        [WeiboSDK sendRequest:request];
        
        if (completion) {
            completion();
        }
    } else if ([@"wx.session" isEqualToString:[platform lowercaseString]] ||
               [@"wx.timeline" isEqualToString:[platform lowercaseString]]){
        
        WXImageObject *ext = [WXImageObject object];
        ext.imageData = UIImageJPEGRepresentation(image, 0.4);
        UIImage* thumbImage = [UIImage scaledImage:image size:CGSizeMake(image.size.width*0.1, image.size.height*0.1)];
        WXMediaMessage *message = [WXMediaMessage message];
        [message setThumbImage:thumbImage];
        message.mediaObject = ext;
        
        SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
        req.bText = NO;
        req.message = message;
        if ([@"wx.session" isEqualToString:[platform lowercaseString]]) {
            req.scene = WXSceneSession;
        } else {
            req.scene = WXSceneTimeline;
        }
        [WXApi sendReq:req completion:^(BOOL success) {
            
        }];
        
        if (completion) {
            completion();
        }
    }
}

+ (void)shareWithUrlString:(NSString *)path title:(NSString *)title description:(NSString *)description thumbImage:(UIImage *)image objectId:(NSString *)objectId toPlatform:(NSString *)platform {
    [BKQShareTool shareWithUrlString:path title:title description:description thumbImage:image objectId:objectId toPlatform:platform completion:nil];
}

+ (void)shareWithUrlString:(NSString *)path title:(nonnull NSString *)title description:(nonnull NSString *)description thumbImage:(nonnull UIImage *)image objectId:(NSString *)objectId toPlatform:(NSString *)platform completion:(void (^ _Nullable)(void))completion{
    
    UIImage *resImage = image;
    if (resImage == nil) {
        resImage = [UIImage imageNamed:@"logo.png"];
    }
    
    if ([@"qq" isEqualToString:[platform lowercaseString]] ||
        [@"qq.space" isEqualToString:[platform lowercaseString]]) {
//        NSData* preImgData = UIImageJPEGRepresentation(image, 0.3);;
//        NSData * imgData = UIImageJPEGRepresentation(image, 0.4);
        QQApiURLObject * urlObj = [QQApiURLObject objectWithURL:[NSURL URLWithString:path] title:title description:description previewImageData:UIImagePNGRepresentation(resImage) targetContentType:QQApiURLTargetTypeNews];
        
        SendMessageToQQReq * req = [SendMessageToQQReq reqWithContent:urlObj];
        
        if ([@"qq" isEqualToString:[platform lowercaseString]]) {
            [QQApiInterface sendReq:req];
        } else {
            [QQApiInterface SendReqToQZone:req];
        }
        
        if (completion) {
            completion();
        }
    } else if ([@"wx.session" isEqualToString:[platform lowercaseString]] ||
               [@"wx.timeline" isEqualToString:[platform lowercaseString]]){
        WXWebpageObject *page = [WXWebpageObject object];
        page.webpageUrl = path;
        
        WXMediaMessage *message = [WXMediaMessage message];
        message.mediaObject = page;
        message.title = title;
        message.description = description;
        message.thumbData = UIImagePNGRepresentation(resImage);
        
        SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
        req.bText = NO;
        req.message = message;
        if ([@"wx.session" isEqualToString:[platform lowercaseString]]) {
            req.scene = WXSceneSession;
        } else {
            req.scene = WXSceneTimeline;
        }
        
        [WXApi sendReq:req completion:^(BOOL success) {
            
        }];
        
        if (completion) {
            completion();
        }
    } else if ([@"weibo" isEqualToString:[platform lowercaseString]]) {
        WBWebpageObject * page = [WBWebpageObject object];
        page.objectID = objectId;
        page.webpageUrl = path;
        page.title = title;
        page.description = description;
        page.thumbnailData = UIImagePNGRepresentation(resImage);
        
        WBMessageObject * message = [WBMessageObject message];
        message.mediaObject = page;
        
        WBSendMessageToWeiboRequest * request = [WBSendMessageToWeiboRequest requestWithMessage:message];
        //request.userInfo = nil;
        //request.shouldOpenWeiboAppInstallPageIfNotInstalled = NO;
        
        [WeiboSDK sendRequest:request];
        
        if (completion) {
            completion();
        }
    }
}

@end
