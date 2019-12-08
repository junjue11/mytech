//
//  ShareViewController.m
//  Mytech
//
//  Created by 周峻觉 on 2019/11/24.
//  Copyright © 2019 周峻觉. All rights reserved.
//

#import "ShareViewController.h"
#import "BKQShareView.h"

@interface ShareViewController ()

@property (nonatomic, strong) BKQShareView *shareView;

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn_1 = [UIButton xn_buttonWithSize:CGSizeMake(100, 44) title:@"分享弹框" titleColor:RGB(0, 0, 0) font:[UIFont systemFontOfSize:14] target:self action:@selector(onShareViewAction:)];
    [self.view addSubview:btn_1];
    btn_1.mj_x = 100;
    btn_1.mj_y = 100;
}

- (void)onShareViewAction:(UIButton *)btn
{
    self.shareView = [[BKQShareView alloc] init];
    [self.shareView show];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
