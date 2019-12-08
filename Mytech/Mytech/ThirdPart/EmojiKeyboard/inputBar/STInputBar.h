//
//  STInputBar.h
//  STEmojiKeyboard
//
//  Created by zhenlintie on 15/5/29.
//  Copyright (c) 2015年 sTeven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STInputBar : UIView



@property (assign, nonatomic) BOOL fitWhenKeyboardShowOrHide;

@property (copy, nonatomic) NSString *placeHolder;
@property (strong, nonatomic) UILabel *textLabel;

- (instancetype)initWithInputBar:(UITextView *)textView;

- (void)setDidSendClicked:(void(^)(NSString *text))handler;


- (void)setInputBarSizeChangedHandle:(void(^)())handler;

@end
