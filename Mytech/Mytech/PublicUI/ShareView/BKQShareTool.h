//
//  BKQShareTool.h
//  BKQ
//
//  Created by 周峻觉 on 2019/4/17.
//  Copyright © 2019 周峻觉. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BKQShareTool : NSObject

#pragma mark - 分享文本到第三方平台，platform: "qq" "qq.space"  "weibo"  "wx.session"  "wx.timeline"
+ (void)shareWithText:(NSString *_Nullable)text toPlatform:(NSString *)platform;
+ (void)shareWithText:(NSString *_Nullable)text toPlatform:(NSString *)platform completion:(void (^ __nullable)(void))completion;

#pragma mark - 分享图片到第三方平台，platform: "qq" "qq.space"  "weibo"  "wx.session"  "wx.timeline"
+ (void)shareWithImage:(UIImage *_Nullable)image toPlatform:(NSString *)platform;
+ (void)shareWithImage:(UIImage *_Nullable)image toPlatform:(NSString *)platform completion:(void (^ __nullable)(void))completion;


/**
 分享链接到第三方平台，platform: "qq"  "qq.space"  "weibo"  "wx.session"  "wx.timeline"

 @param path <#path description#>
 @param title <#title description#>
 @param description <#description description#>
 @param image <#image description#>
 @param objectId 当分享到微博平台时，需要提供一个唯一的objectId. 最好和后台的数据对应。
 @param platform <#action description#>
 */
+ (void)shareWithUrlString:(NSString *)path title:(NSString *)title description:(NSString *)description thumbImage:(UIImage *)image objectId:(NSString * _Nullable)objectId toPlatform:(NSString *)platform;
+ (void)shareWithUrlString:(NSString *)path title:(NSString *)title description:(NSString *)description thumbImage:(UIImage *)image objectId:(NSString * _Nullable)objectId toPlatform:(NSString *)platform completion:(void (^ __nullable)(void))completion;

@end

NS_ASSUME_NONNULL_END
