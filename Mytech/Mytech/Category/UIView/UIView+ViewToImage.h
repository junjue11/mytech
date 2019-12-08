//
//  UIView+ViewToImage.h
//  Mytech
//
//  Created by 周峻觉 on 2019/11/24.
//  Copyright © 2019 周峻觉. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ViewToImage)

+ (UIImage*)my_convertViewToImage:(UIView*)view;

@end

NS_ASSUME_NONNULL_END
