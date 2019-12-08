//
//  XNSearhBar.h
//  GoIco
//
//  Created by Lihong.zhu on 2018/8/5.
//  Copyright © 2018年 ico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XNSearhBar : UIControl

@property (nonatomic, strong) UIImage *leftImage;   // 有默认值
@property (nonatomic, strong) UIImage *rightImage;  // 有默认值
@property (nonatomic, copy) NSString *placeholder ;   // 有默认值
@property (nonatomic,copy)  NSAttributedString *attributedPlaceholder;
@property (nonatomic, strong) NSString *text;
//@property (strong, readonly) UITextField *textField;

@property (nonatomic, assign) UIEdgeInsets contentInsets;

// action
@property (nonatomic, strong) BOOL(^beginEditing)(XNSearhBar *searchBar);
@property (nonatomic, strong) void(^didSearch)(XNSearhBar *searchBar);
@property (nonatomic, strong) void(^textDidChange)(XNSearhBar *searchBar);

- (void)updateAppearance;

- (void)showLeftImage;
- (void)hideLeftImage;
- (void)showRightImage;
- (void)hideRightImage;

@end
