//
//  WebSocketViewController.m
//  Mytech
//
//  Created by 周峻觉 on 2019/11/24.
//  Copyright © 2019 周峻觉. All rights reserved.
//

#import "WebSocketViewController.h"
#import "WebSocketTool.h"

@interface WebSocketViewController ()

@property (nonatomic, strong) UIButton *sendBtn;
@property (nonatomic, strong) WebSocketTool *sr;

@end

@implementation WebSocketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.sendBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.sendBtn setTitle:@"Send" forState:UIControlStateNormal];
    [self.sendBtn addTarget:self action:@selector(sendData:) forControlEvents:UIControlEventTouchUpInside];
    [self.sendBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:self.sendBtn];
    
    self.sr = [WebSocketTool shareInstance];
    [self.sr setServerURLString:@"ws://121.40.165.18:8800"];
    [self.sr open];
    [self.sr registerNetworkNotifications];
    self.sr.didReceiveMessage = ^(id  _Nonnull message) {
        NSLog(@"%@", message);
    };
}

- (void)sendData:(UIButton *)sendBtn {
    [self.sr sendData:@{@"name":@"zhoujunjue"} withRequestURI:@""];
}

@end
