//
//  BKQShareBox.h
//  LiangFengYouXin
//
//  Created by 周峻觉 on 2017/8/10.
//  Copyright © 2017年 周峻觉. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BKQSharePlatform) {
    BKQSharePlatformWechat,
    BKQSharePlatformWechatFriends,
    BKQSharePlatformQQ,
    BKQSharePlatformQQSpace,
    BKQSharePlatformWeibo,
};

@class BKQShareBox;

@protocol BKQShareBoxDelegate <NSObject>

@optional

- (void)shareBox:(BKQShareBox *)box didSelectedPlatform:(BKQSharePlatform)platform;
- (void)shareBoxShouldClose:(BKQShareBox *)box;

@end

@interface BKQShareBox : UIView

@property(nonatomic, weak)id<BKQShareBoxDelegate> delegate;

@end


