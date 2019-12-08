//
//  HomeViewController.m
//  Mytech
//
//  Created by 周峻觉 on 2019/3/4.
//  Copyright © 2019年 周峻觉. All rights reserved.
//

#import "HomeViewController.h"
#import "MacroViewController.h"
#import "DeviceViewController.h"
#import "WebSocketViewController.h"
#import "ShareViewController.h"
#import "HomeTableViewCell.h"

@interface HomeViewController ()

@property (nonatomic, strong) NSMutableArray *vcModelArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    [self initData];
    [self configReusableCell];
}

- (void)configReusableCell {
    
    [self.tableView registerClass:NSClassFromString(@"HomeTableViewCell") forCellReuseIdentifier:@"HomeTableViewCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.vcModelArray.count;
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     
     UITableViewCell *cell = nil;
     NSDictionary *cellModel = [self.vcModelArray objectAtIndex:indexPath.row];
     
     cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCell" forIndexPath:indexPath];
     cell.textLabel.text = cellModel[@"title"];
     cell.detailTextLabel.text = cellModel[@"subTitle"];
     cell.detailTextLabel.numberOfLines = 0;
     [cell.detailTextLabel sizeToFit];
     
     return cell;
 }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *cellModel = [self.vcModelArray objectAtIndex:indexPath.row];
    Class cls = NSClassFromString(cellModel[@"vcClassName"]);
    UIViewController * vc = [[cls alloc] init];
    vc.title = cellModel[@"title"];
    [self.navigationController pushViewController:vc animated:YES];
}


- (NSMutableDictionary *)vcModelFactory {
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    dict[@"vcClassName"] = @"";
    dict[@"title"] = @"";
    dict[@"subTitle"] = @"";
    return dict;
}

- (NSMutableArray *)vcModelArray {
    if (_vcModelArray == nil) {
        _vcModelArray = [[NSMutableArray alloc] init];
    }
    return _vcModelArray;
}

- (void)initData {
    
    // 宏定义
    NSMutableDictionary *macroVCModelDict = [self vcModelFactory];
    macroVCModelDict[@"vcClassName"] = @"MacroViewController";
    macroVCModelDict[@"title"] = @"宏定义";
    macroVCModelDict[@"subTitle"] = @"显示一些宏定义的值 [MacroViewController]";
    [self.vcModelArray addObject:macroVCModelDict];
    
    // 设备信息
    NSMutableDictionary *deviceVCModelDict = [self vcModelFactory];
    deviceVCModelDict[@"vcClassName"] = @"DeviceViewController";
    deviceVCModelDict[@"title"] = @"设备";
    deviceVCModelDict[@"subTitle"] = @"显示一些设备的信息 [DeviceViewController]";
    [self.vcModelArray addObject:deviceVCModelDict];
    
    // WebSocket
    NSMutableDictionary *websocketVCModelDict = [self vcModelFactory];
    websocketVCModelDict[@"vcClassName"] = @"WebSocketViewController";
    websocketVCModelDict[@"title"] = @"WebSocket";
    websocketVCModelDict[@"subTitle"] = @"WebSocket长连接 [WebSocketViewController]";
    [self.vcModelArray addObject:websocketVCModelDict];
    
    // 第三方分享弹框
    NSMutableDictionary *shareVCModelDict = [self vcModelFactory];
    shareVCModelDict[@"vcClassName"] = @"ShareViewController";
    shareVCModelDict[@"title"] = @"第三方分享弹框";
    shareVCModelDict[@"subTitle"] = @"第三方分享弹框，如：微信 QQ 微博 朋友圈等 [ShareViewController]";
    [self.vcModelArray addObject:shareVCModelDict];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
