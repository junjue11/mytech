//
//  STInputBar.m
//  STEmojiKeyboard
//
//  Created by zhenlintie on 15/5/29.
//  Copyright (c) 2015年 sTeven. All rights reserved.
//

#import "STInputBar.h"
#import "STEmojiKeyboard.h"

#define kSTIBDefaultHeight 44
#define kSTLeftButtonWidth 50
#define kSTLeftButtonHeight 30
#define kSTRightButtonWidth 100
#define kSTTextviewDefaultHeight 34
#define kSTTextviewMaxHeight 80

@interface STInputBar () <UITextViewDelegate>

@property (strong, nonatomic) UIButton *keyboardTypeButton;
@property (strong, nonatomic) UITextView *textView;
//@property (strong, nonatomic) UIButton *sendButton;

@property (strong, nonatomic) STEmojiKeyboard *keyboard;
//@property (strong, nonatomic) UILabel *placeHolderLabel;
//@property (strong, nonatomic) UILabel *textLabel;

@property (strong, nonatomic) UIView* topLine;
@property (strong, nonatomic) UIView* bomLine;

@property (strong, nonatomic) void (^sendDidClickedHandler)(NSString *);
@property (strong, nonatomic) void (^sizeChangedHandler)();

@end

@implementation STInputBar{
    BOOL _isRegistedKeyboardNotif;
    BOOL _isDefaultKeyboard;
    NSArray *_switchKeyboardImages;
}

- (instancetype)initWithInputBar:(UITextView *)textView{
    self = [super init];
    if (self) {
        self.textView = textView;
    }
    return self;
}

- (void)dealloc{
    if (_isRegistedKeyboardNotif){
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kSTIBDefaultHeight)]){
        _isRegistedKeyboardNotif = NO;
        _isDefaultKeyboard = YES;
        _switchKeyboardImages = @[@"me_release_smile",@"me_release_keyboard"];
        [self loadUI];
    }
    return self;
}

- (void)loadUI{
    self.backgroundColor = [UIColor whiteColor];
    
    _keyboard = [STEmojiKeyboard keyboard];
    
    self.keyboardTypeButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, (kSTIBDefaultHeight-kSTLeftButtonHeight)/2, kSTLeftButtonWidth, kSTLeftButtonHeight)];
    self.keyboardTypeButton.highlighted = NO;
    [_keyboardTypeButton addTarget:self action:@selector(keyboardTypeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    _keyboardTypeButton.tag = 0;
    [_keyboardTypeButton setImage:[UIImage imageNamed:_switchKeyboardImages[_keyboardTypeButton.tag]] forState:UIControlStateNormal];
    
    self.textLabel = [[UILabel alloc]init];
    self.textLabel.frame = CGRectMake(self.frame.size.width-kSTRightButtonWidth - 12, 0, kSTRightButtonWidth, kSTIBDefaultHeight);
    self.textLabel.text = @"0/500";
    self.textLabel.textAlignment = NSTextAlignmentRight;
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:self.textLabel.text attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14], NSForegroundColorAttributeName : [UIColor redColor]}];
    [attribute addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, self.textLabel.text.length - 4)];
    self.textLabel.attributedText = attribute;
    
    [self addSubview:_keyboardTypeButton];
    [self addSubview:_textView];
    [self addSubview:_textLabel];
    
    [self addSubview:self.topLine];
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_offset(0);
        make.height.mas_equalTo(.5);
    }];
    
    [self addSubview:self.bomLine];
    [self.bomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(.5);
    }];
    
}

- (void)layout{
    
    CGRect textViewFrame = self.textView.frame;
    CGSize textSize = [self.textView sizeThatFits:CGSizeMake(CGRectGetWidth(textViewFrame), 1000.0f)];
    
    CGFloat offset = 10;
    self.textView.scrollEnabled = (textSize.height > kSTTextviewMaxHeight-offset);
    textViewFrame.size.height = MAX(kSTTextviewDefaultHeight, MIN(kSTTextviewMaxHeight, textSize.height));
    self.textView.frame = textViewFrame;
    
    CGRect addBarFrame = self.frame;
    CGFloat maxY = CGRectGetMaxY(addBarFrame);
    addBarFrame.size.height = textViewFrame.size.height+offset;
    addBarFrame.origin.y = maxY-addBarFrame.size.height;
    self.frame = addBarFrame;
    
    self.keyboardTypeButton.center = CGPointMake(CGRectGetMidX(self.keyboardTypeButton.frame), CGRectGetHeight(addBarFrame)/2.0f);
    
    if (self.sizeChangedHandler){
        self.sizeChangedHandler();
    }
}

#pragma mark - public

- (void)setPlaceHolder:(NSString *)placeHolder{
//    _placeHolderLabel.text = placeHolder;
    _placeHolder = [placeHolder copy];
    self.textLabel.text = [NSString stringWithFormat:@"%ld/500",placeHolder.length];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:self.textLabel.text attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14], NSForegroundColorAttributeName : [UIColor redColor]}];
    [attribute addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, self.textLabel.text.length - 4)];
    self.textLabel.attributedText = attribute;
}

- (BOOL)resignFirstResponder{
    [super resignFirstResponder];
    return [_textView resignFirstResponder];
}

- (void)registerKeyboardNotif{
    _isRegistedKeyboardNotif = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)setDidSendClicked:(void (^)(NSString *))handler{
    _sendDidClickedHandler = handler;
}

- (void)setInputBarSizeChangedHandle:(void (^)())handler{
    _sizeChangedHandler = handler;
}

- (void)setFitWhenKeyboardShowOrHide:(BOOL)fitWhenKeyboardShowOrHide{
    if (fitWhenKeyboardShowOrHide){
        [self registerKeyboardNotif];
    }
    if (!fitWhenKeyboardShowOrHide && _fitWhenKeyboardShowOrHide){
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
    _fitWhenKeyboardShowOrHide = fitWhenKeyboardShowOrHide;
}

#pragma mark - notif

- (void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary* info = [notification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    [UIView animateWithDuration:[info[UIKeyboardAnimationDurationUserInfoKey] doubleValue]
                          delay:0
                        options:([info[UIKeyboardAnimationCurveUserInfoKey] integerValue]<<16)
                     animations:^{
                         CGRect newInputBarFrame = self.frame;
                         newInputBarFrame.origin.y = [UIScreen mainScreen].bounds.size.height-CGRectGetHeight(self.frame)-kbSize.height;
                         self.frame = newInputBarFrame;
                     }
                     completion:nil];
}

- (void)keyboardWillHidden:(NSNotification *)notification {
    NSDictionary* info = [notification userInfo];
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    [UIView animateWithDuration:[info[UIKeyboardAnimationDurationUserInfoKey] doubleValue]
                          delay:0
                        options:([info[UIKeyboardAnimationCurveUserInfoKey] integerValue]<<16)
                     animations:^{
                         self.center = CGPointMake(self.bounds.size.width/2.0f, height + CGRectGetHeight(self.frame) - CGRectGetHeight(self.frame)/2.0);
//                         CGRectGetHeight(self.view.bounds)+CGRectGetHeight(_inputBar.frame) - CGRectGetHeight(_inputBar.frame)/2
                     }
                     completion:nil];
}


#pragma mark - action

- (void)sendTextCommentTaped:(UIButton *)button{
    if (self.sendDidClickedHandler){
        self.sendDidClickedHandler(self.textView.text);
        self.textView.text = @"";
        [self layout];
    }
}

- (void)keyboardTypeButtonClicked:(UIButton *)button{
    if (button.tag == 1){
        self.textView.inputView = nil;
    }else{
        [_keyboard setTextView:self.textView];
    }
    [self.textView reloadInputViews];
    button.tag = (button.tag+1)%2;
    [_keyboardTypeButton setImage:[UIImage imageNamed:_switchKeyboardImages[button.tag]] forState:UIControlStateNormal];
    [_textView becomeFirstResponder];
}

- (UIView *)topLine
{
    if(!_topLine){
        _topLine = [UIView new];
        [_topLine setBackgroundColor:[UIColor colorWithRGB:0xf0f0f0]];
    }
    return _topLine;
}

- (UIView *)bomLine{
    if (!_bomLine) {
        _bomLine = [[UIView alloc]init];
        [_bomLine setBackgroundColor:[UIColor colorWithRGB:0xf0f0f0]];
    }
    return _bomLine;
}

@end
