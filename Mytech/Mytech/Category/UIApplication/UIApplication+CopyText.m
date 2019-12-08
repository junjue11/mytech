//
//  UIApplication+CopyText.m
//  Mytech
//
//  Created by 周峻觉 on 2019/11/24.
//  Copyright © 2019 周峻觉. All rights reserved.
//

#import "UIApplication+CopyText.h"

@implementation UIApplication (CopyText)

+ (void)copyText:(NSString *)text {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = text;
}

@end
