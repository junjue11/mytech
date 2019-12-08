//
//  DeviceViewController.m
//  Mytech
//
//  Created by 周峻觉 on 2019/3/5.
//  Copyright © 2019年 周峻觉. All rights reserved.
//

#import "DeviceViewController.h"
#import "UIDevice+DeviceType.h"

@interface DeviceViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation DeviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView.frame = self.view.bounds;
    self.scrollView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.1];
    [self.view addSubview:self.scrollView];
    
    UIDevice *device = [UIDevice currentDevice];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, kScreenWidth-40, 44)];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = [NSString stringWithFormat:@"系统名称：%@", device.systemName];
    nameLabel.numberOfLines = 0;
    [self.scrollView addSubview:nameLabel];
    [nameLabel sizeToFit];
    
    UILabel *versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(nameLabel.frame)+20, kScreenWidth-40, 44)];
    versionLabel.textColor = [UIColor blackColor];
    versionLabel.text = [NSString stringWithFormat:@"系统版本号：%@", device.systemVersion];
    versionLabel.numberOfLines = 0;
    [self.scrollView addSubview:versionLabel];
    [versionLabel sizeToFit];
    
    UILabel *brandLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(versionLabel.frame)+20, kScreenWidth-40, 44)];
    brandLabel.textColor = [UIColor blackColor];
    brandLabel.text = [NSString stringWithFormat:@"设备品牌：%@", device.model];
    brandLabel.numberOfLines = 0;
    [self.scrollView addSubview:brandLabel];
    [brandLabel sizeToFit];
    
    UILabel *typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(brandLabel.frame)+20, kScreenWidth-40, 44)];
    typeLabel.textColor = [UIColor blackColor];
    typeLabel.text = [NSString stringWithFormat:@"设备型号：%@", device.deviceType];
    typeLabel.numberOfLines = 0;
    [self.scrollView addSubview:typeLabel];
    [typeLabel sizeToFit];
    
    UILabel *uuidLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(typeLabel.frame)+20, kScreenWidth-40, 44)];
    uuidLabel.textColor = [UIColor blackColor];
    uuidLabel.text = [NSString stringWithFormat:@"UUID：%@", device.identifierForVendor];
    uuidLabel.numberOfLines = 0;
    [self.scrollView addSubview:uuidLabel];
    [uuidLabel sizeToFit];
    
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width, CGRectGetMaxY(uuidLabel.frame)+20);
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
