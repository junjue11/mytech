//
//  UIApplication+URL.m
//  Mytech
//
//  Created by 周峻觉 on 2019/11/24.
//  Copyright © 2019 周峻觉. All rights reserved.
//

#import "UIApplication+URL.h"

@implementation UIApplication (URL)

+ (void)my_openURL:(NSString *)urlString {
    BOOL isCan = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlString]];
    if (isCan) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]
                                           options:@{UIApplicationOpenURLOptionsSourceApplicationKey:@YES}
                                 completionHandler:^(BOOL success) {
            
        }];
    }
}

@end
