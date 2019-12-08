//
//  WebSocketTool.m
//  WebSocketTest
//
//  Created by 周峻觉 on 2019/10/16.
//  Copyright © 2019 周峻觉. All rights reserved.
//

#import "WebSocketTool.h"
#import <AFNetworkReachabilityManager.h>

#define dispatch_main_async_safe(block) \
if ([NSThread isMainThread]) { \
block(); \
} else { \
dispatch_async(dispatch_get_main_queue(), block); \
}

#define WeakSelf(type) __weak typeof(type) weak##type = type;

typedef NS_ENUM(NSUInteger, SocketDataType) {
    distributeOrder,
    cancelCall,
    orderLost,
    changeDeviceType,
};

@interface WebSocketTool () <SRWebSocketDelegate>
{
    NSTimer * heartBeat;
    NSTimeInterval reConnectTime;
    SocketDataType type;
    NSString *host;
}

@property (nonatomic, strong) SRWebSocket *socket;

@end

@implementation WebSocketTool

+ (WebSocketTool *)shareInstance{
    static WebSocketTool *Instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        Instance = [[WebSocketTool alloc] init];
    });
    return Instance;
}

- (void)setServerURLString:(NSString *)urlString
{
    host = urlString;
}

- (void)registerNetworkNotifications{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkChangedNote:) name:AFNetworkingReachabilityDidChangeNotification object:nil];
}

- (void)networkChangedNote:(NSNotification *)note {
    AFNetworkReachabilityStatus status = [note.userInfo[AFNetworkingReachabilityNotificationStatusItem] integerValue];
    switch (status) {
        case AFNetworkReachabilityStatusUnknown:
            NSLog(@"网络类型：未知网络");
            break;
        case AFNetworkReachabilityStatusNotReachable:
            NSLog(@"网络类型：断网");
            break;
        case AFNetworkReachabilityStatusReachableViaWWAN:
            NSLog(@"网络类型：数据流量");
            [self open];
            break;
        case AFNetworkReachabilityStatusReachableViaWiFi:
            NSLog(@"网络类型：WIFI");
            [self open];
            break;
    }
}

- (void)open {
    //如果是同一个url return
    if (host == nil ||
        ![host isKindOfClass:[NSString class]] ||
        host.length == 0) {
        NSLog(@"************************** socket 地址错误 ************************** ");
        return;
    }
    
    if (self.socket) {
        return;
    }
    
    if (self.socket.readyState == SR_OPEN) {
        return;
    }
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",host]];
    self.socket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:url]];
    NSLog(@"************************** socket 地址 ************************** ");
    NSLog(@"%@",self.socket.url.absoluteString);
    self.socket.delegate = self;   //实现这个 SRWebSocketDelegate 协议
    [self.socket open];     //open 就是直接连接了
}

- (void)close {
    if (self.socket) {
        [self.socket close];
        self.socket = nil;
        [self destoryHeartBeat];
    }
}

- (void)webSocketDidOpen:(SRWebSocket *)webSocket {
    //每次正常连接的时候清零重连时间
    reConnectTime = 0;
    [self initHeartBeat];
    if (webSocket == self.socket) {
        NSLog(@"************************** socket 连接成功************************** ");
    }
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {

    if (webSocket == self.socket) {
        NSLog(@"************************** socket 连接失败************************** ");
        _socket = nil;
        //连接失败就重连
        [self reConnect];
    }
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean {
    
    if (webSocket == self.socket) {
        NSLog(@"************************** socket 连接断开************************** ");
        NSLog(@"被关闭连接，code:%ld,reason:%@,wasClean:%d",(long)code,reason,wasClean);
            [self close];
    }

}

- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload {
    NSString *reply = [[NSString alloc] initWithData:pongPayload
                                            encoding:NSUTF8StringEncoding];
     NSLog(@"reply===%@",reply);
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
    if (webSocket == self.socket) {
        NSLog(@"************************** socket收到数据了************************** ");
        NSLog(@"message:%@",message);
        if(!message){
            return;
        }
        [self handleReceivedMessage:message];
    }
}

- (void)handleReceivedMessage:(id)message {
    if (self.didReceiveMessage) {
        self.didReceiveMessage(message);
    }
}

- (void)reConnect {
    [self close];
    if (reConnectTime > 64*2) {
        return;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(reConnectTime * NSEC_PER_SEC)), dispatch_get_main_queue(),^{
        self.socket = nil;
        [self open];
        NSLog(@"重连");
    });
    
    //重连时间2的指数级增长
    if (reConnectTime == 0) {
        reConnectTime = 2;
    }else{
        reConnectTime *= 2;
    }
}

- (void)initHeartBeat {
    dispatch_main_async_safe(^{
        [self destoryHeartBeat];
        
        self->heartBeat = [NSTimer timerWithTimeInterval:30 target:self selector:@selector(ping) userInfo:nil repeats:YES];
        //和服务端约定好发送什么作为心跳标识，尽可能的减小心跳包大小
        [[NSRunLoop currentRunLoop]addTimer:self->heartBeat forMode:NSRunLoopCommonModes];
    })
}

//取消心跳
- (void)destoryHeartBeat
{
    dispatch_main_async_safe(^{
        if (self->heartBeat) {
            if ([self->heartBeat respondsToSelector:@selector(isValid)]){
                if ([self->heartBeat isValid]){
                    [self->heartBeat invalidate];
                    self->heartBeat = nil;
                }
            }
        }
    })
}

- (void)ping {
    if (self.socket.readyState == SR_OPEN) {
        [self.socket sendPing:nil];
    }
}

- (void)sendData:(NSDictionary *)paramDic withRequestURI:(NSString *)requestURI {
    NSDictionary *configDic = paramDic;
    
    //requestURI = [NSString stringWithFormat:@"/api/%@",requestURI];

    //    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //    NSDictionary *configDic = @{
    //                                @"usersign"  :appDelegate.appToken,
    //                                @"command"   :@"response",
    //                                @"requestURI":requestURI,                                @"headers"   :@{@"Version":AboutVersion,
    //                                                @"Token":appDelegate.appToken,
    //                                                @"LoginName":appDelegate.appLoginName},
    //                                @"params"    :paramDic
    //                                };
         NSLog(@"socketSendData--configDic --------------- %@",configDic);
        NSError *error;
        NSString *data;
        //(NSJSONWritingOptions) (paramDic ? NSJSONWritingPrettyPrinted : 0)
        //采用这个格式的json数据会比较好看，但是不是服务器需要的
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:configDic
                                                           options:0
                                                             error:&error];

        if (!jsonData) {
            NSLog(@" error: %@", error.localizedDescription);
            return;
        } else {
            data = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            //这是为了取代requestURI里的"\"
            //data = [data stringByReplacingOccurrencesOfString:@"\\" withString:@""];
        }
        WeakSelf(self);
    
    dispatch_queue_t queue = dispatch_queue_create("zy", NULL);
    
    dispatch_async(queue, ^{
        if (weakself.socket != nil) {
            if (weakself.socket.readyState == SR_OPEN) {
                [weakself.socket send:data];
            } else if (weakself.socket.readyState == SR_CLOSING || weakself.socket.readyState == SR_CLOSED) {
                // websocket 断开了，调用 reConnect 方法重连
                NSLog(@"重连");
                
                [weakself reConnect];
            }
        } else {
            [weakself open];
        }
    });
}

-(SRReadyState)socketReadyState{
    return self.socket.readyState;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"WebSocketTool dealloced");
}

@end
