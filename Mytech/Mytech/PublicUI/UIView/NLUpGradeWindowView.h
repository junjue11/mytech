//
//  NLUpGradeWindowView.h
//  LightVoice
//
//  Created by zhoujiebing on 2018/11/2.
//  Copyright © 2018年 xiaoniu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NLUpGradeWindowView : UIView

- (void)public_updateVersion:(NSString *)version desStr:(NSString *)desStr linkUrl:(NSString *)linkUrl isForceUpdate:(BOOL)isForceUpdate dismissBlock:(void(^)(void))dismissBlock;

@end

