//
//  XNSearhBar.m
//  GoIco
//
//  Created by Lihong.zhu on 2018/8/5.
//  Copyright © 2018年 ico. All rights reserved.
//

#import "XNSearhBar.h"

@interface XNSearhBar () <UITextFieldDelegate>

@property (strong, nonatomic) UIImageView *leftImageView;
@property (strong, nonatomic) UIImageView *rightImageView;
@property (strong, nonatomic) UITextField *textField;

@end


@implementation XNSearhBar

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.leftImageView];
        [self addSubview:self.rightImageView];
        [self addSubview:self.textField];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat imageViewWH = self.height - _contentInsets.top - _contentInsets.bottom;
    // 左侧图片
    self.leftImageView.frame = CGRectMake(_contentInsets.left, _contentInsets.top, imageViewWH, imageViewWH);
    self.leftImageView.centerY = self.height * 0.5;
    
    // 右侧图片
    self.rightImageView.frame = CGRectMake(self.width - imageViewWH - _contentInsets.right, _contentInsets.top, imageViewWH, imageViewWH);
    self.leftImageView.centerY = self.height * 0.5;
    
    // 输入框
    CGFloat textFieldX = _contentInsets.left;
    CGFloat textFieldH = imageViewWH;
    CGFloat textFieldW = self.width;
    if (self.leftImageView.hidden == NO) {
        textFieldX = self.leftImageView.right + 8 * kScaleX;
    }
    textFieldW = textFieldW - textFieldX;
    
    if (self.rightImageView.hidden == NO) {
        textFieldW = textFieldW - (8 * kScaleX + self.rightImageView.width + _contentInsets.right);
    } else {
        textFieldW = textFieldW - _contentInsets.right;
    }
    self.textField.frame = CGRectMake(textFieldX, _contentInsets.top, textFieldW, textFieldH);
    self.textField.centerY = self.height * 0.5;
}

- (void)updateAppearance
{
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (BOOL)resignFirstResponder
{
    [super resignFirstResponder];
    return [self.textField resignFirstResponder];
}

- (BOOL)becomeFirstResponder
{
    [super becomeFirstResponder];
    return [self.textField becomeFirstResponder];
}

- (void)showLeftImage
{
    if (self.leftImageView.hidden) {
        self.leftImageView.hidden = NO;
        self.leftImageView.alpha = 0;
        
        CGFloat textFieldX = self.leftImageView.right + 8 * kScaleX;
        CGFloat textFieldH = self.height - _contentInsets.top - _contentInsets.bottom;
        CGFloat textFieldW = self.width - textFieldX;
        
        if (self.rightImageView.hidden == NO) {
            textFieldW = textFieldW - (8 * kScaleX + self.rightImageView.width + _contentInsets.right);
        } else {
            textFieldW = textFieldW - _contentInsets.right;
        }
        
        [UIView animateWithDuration:0.25 animations:^{
            self.leftImageView.alpha = 1.0;
            self.textField.frame = CGRectMake(textFieldX, self->_contentInsets.top, textFieldW, textFieldH);
        } completion:^(BOOL finished) {
            self.textField.centerY = self.height * 0.5;
        }];
    }
}

- (void)hideLeftImage
{
    if (self.leftImageView.hidden == NO) {
        
        CGFloat textFieldX = self.leftImageView.right + 8 * kScaleX;
        CGFloat textFieldH = self.height - _contentInsets.top - _contentInsets.bottom;
        CGFloat textFieldW = self.width - _contentInsets.left;
        
        if (self.rightImageView.hidden == NO) {
            textFieldW = textFieldW - (8 * kScaleX + self.rightImageView.width + _contentInsets.right);
        } else {
            textFieldW = textFieldW - _contentInsets.right;
        }
        
        [UIView animateWithDuration:0.25 animations:^{
            self.leftImageView.alpha = 0.0;
            self.textField.frame = CGRectMake(textFieldX, self->_contentInsets.top, textFieldW, textFieldH);
        } completion:^(BOOL finished) {
            self.leftImageView.hidden = YES;
            self.textField.centerY = self.height * 0.5;
        }];
    }
}

- (void)showRightImage
{
    if (self.rightImageView.hidden) {
        self.rightImageView.hidden = NO;
        self.rightImageView.alpha = 0;
        
        CGFloat textFieldX = _contentInsets.left;
        if (self.leftImageView.hidden == NO) {
            textFieldX = self.leftImageView.right + 8 * kScaleX;
        }
        
        CGFloat textFieldH = self.height - _contentInsets.top - _contentInsets.bottom;
        CGFloat textFieldW = self.width - textFieldX - (8 * kScaleX + self.rightImageView.width + _contentInsets.right);
        
        [UIView animateWithDuration:0.25 animations:^{
            self.rightImageView.alpha = 1.0;
            self.textField.frame = CGRectMake(textFieldX, self->_contentInsets.top, textFieldW, textFieldH);
        } completion:^(BOOL finished) {
            self.textField.centerY = self.height * 0.5;
        }];
    }
}

- (void)hideRightImage
{
    if (self.rightImageView.hidden == NO) {
        
        CGFloat textFieldX = _contentInsets.left;
        if (self.leftImageView.hidden == NO) {
            textFieldX = self.leftImageView.right + 8 * kScaleX;
        }
        
        CGFloat textFieldH = self.height - _contentInsets.top - _contentInsets.bottom;
        CGFloat textFieldW = self.width - textFieldX - _contentInsets.right;
        
        [UIView animateWithDuration:0.25 animations:^{
            self.rightImageView.alpha = 0.0;
            self.textField.frame = CGRectMake(textFieldX, self->_contentInsets.top, textFieldW, textFieldH);
        } completion:^(BOOL finished) {
            self.rightImageView.hidden = YES;
            self.textField.centerY = self.height * 0.5;
        }];
    }
}

#pragma mark - response event
- (void)onTextDidChange:(NSNotification *)noti
{
    if (self.textDidChange) {
        self.textDidChange(self);
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (self.beginEditing) {
        return self.beginEditing(self);
    }
    return true;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (self.didSearch) {
        self.didSearch(self);
    }
    return true;
}

#pragma mark - getter & setter
- (UIImageView *)leftImageView
{
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc] initWithImage:XNImage(@"searchbar_search")];
    }
    return _leftImageView;
}

- (UIImageView *)rightImageView
{
    if (!_rightImageView) {
        _rightImageView = [[UIImageView alloc] initWithImage:XNImage(@"searchbar_delete")];
        _rightImageView.userInteractionEnabled = YES;
        
        __weak typeof(self) weakSelf = self;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
            weakSelf.text = nil;
            if (weakSelf.textDidChange) {
                weakSelf.textDidChange(weakSelf);
            }
        }];
        [_rightImageView addGestureRecognizer:tap];
    }
    return _rightImageView;
}

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.placeholder = @"搜索";
        _textField.delegate = self;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onTextDidChange:)
                                                     name:UITextFieldTextDidChangeNotification object:nil];
    }
    return _textField;
}

- (void)setLeftImage:(UIImage *)leftImage
{
    self.leftImageView.image = leftImage;
}

- (void)setRightImage:(UIImage *)rightImage
{
    self.rightImageView.image = rightImage;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    self.textField.placeholder = placeholder;
}

- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder
{
    self.textField.attributedPlaceholder = attributedPlaceholder;
}

- (void)setText:(NSString *)text
{
    self.textField.text = text;
}

- (NSString *)text
{
    return self.textField.text;
}

@end
