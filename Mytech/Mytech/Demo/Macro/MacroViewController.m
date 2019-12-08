//
//  MacroViewController.m
//  Mytech
//
//  Created by 周峻觉 on 2019/3/4.
//  Copyright © 2019年 周峻觉. All rights reserved.
//

#import "MacroViewController.h"

@interface MacroViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation MacroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView.frame = self.view.bounds;
    self.scrollView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.1];
    [self.view addSubview:self.scrollView];
    
    UILabel *docLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, kScreenWidth-40, 44)];
    docLabel.textColor = [UIColor blackColor];
    docLabel.text = [NSString stringWithFormat:@"Document目录：%@", DocDir];
    docLabel.numberOfLines = 0;
    [self.scrollView addSubview:docLabel];
    [docLabel sizeToFit];
    
    UILabel *cacheLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(docLabel.frame)+20, kScreenWidth-40, 44)];
    cacheLabel.textColor = [UIColor blackColor];
    cacheLabel.text = [NSString stringWithFormat:@"Cache目录：%@", CacheDir];
    cacheLabel.numberOfLines = 0;
    [self.scrollView addSubview:cacheLabel];
    [cacheLabel sizeToFit];
    
    UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(cacheLabel.frame)+20, kScreenWidth-40, 44)];
    tempLabel.textColor = [UIColor blackColor];
    tempLabel.text = [NSString stringWithFormat:@"Temporary目录：%@", TempDir];
    tempLabel.numberOfLines = 0;
    [self.scrollView addSubview:tempLabel];
    [tempLabel sizeToFit];
    
    UILabel *resolutionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(tempLabel.frame)+20, kScreenWidth-40, 44)];
    resolutionLabel.textColor = [UIColor blackColor];
    resolutionLabel.text = [NSString stringWithFormat:@"屏幕分辨率：%.fpt x %.fpt, 设备分辨率：%.fpx x %.fpx", kScreenWidth, kScreenHeight, kDeviceWidth, kDeviceHeight];
    resolutionLabel.numberOfLines = 0;
    [self.scrollView addSubview:resolutionLabel];
    [resolutionLabel sizeToFit];
    
    UILabel *statusBarLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(resolutionLabel.frame)+20, kScreenWidth-40, 44)];
    statusBarLabel.textColor = [UIColor blackColor];
    statusBarLabel.text = [NSString stringWithFormat:@"状态栏的高度：%.f, 导航栏的高度：%.f, 标签栏高度：%.f", kStatusHeight, kNavBarHeight, kTabBarHeight];
    statusBarLabel.numberOfLines = 0;
    [self.scrollView addSubview:statusBarLabel];
    [statusBarLabel sizeToFit];
    
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width, CGRectGetMaxY(statusBarLabel.frame)+20);
}

- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
    }
    return _scrollView;
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
