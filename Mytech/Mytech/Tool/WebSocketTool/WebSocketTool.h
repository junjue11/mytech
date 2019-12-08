//
//  WebSocketTool.h
//  WebSocketTest
//
//  Created by 周峻觉 on 2019/10/16.
//  Copyright © 2019 周峻觉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SocketRocket.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebSocketTool : NSObject

@property (nonatomic, assign) SRReadyState socketReadyState;
@property (nonatomic, copy) void (^didReceiveMessage)(id message);

+ (WebSocketTool *)shareInstance;

- (void)setServerURLString:(NSString *)urlString;
- (void)open;
- (void)close;
- (void)sendData:(NSDictionary *)paramDic withRequestURI:(NSString *)requestURI;
- (void)registerNetworkNotifications;

@end

NS_ASSUME_NONNULL_END
