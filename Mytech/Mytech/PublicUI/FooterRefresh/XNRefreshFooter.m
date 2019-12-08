//
//  XNRefreshFooter.m
//  AidouPeipei
//
//  Created by zhoujunnjue on 2019/11/12.
//  Copyright © 2019 zhoujunnjue. All rights reserved.
//

#import "XNRefreshFooter.h"

@interface XNRefreshFooter()

@property (weak, nonatomic) UILabel *stateLabel;
@property (weak, nonatomic) UIImageView *animateImageView;
@property (weak, nonatomic) UIView *leftLineView;
@property (weak, nonatomic) UIView *rightLineView;

@property (strong, nonatomic) NSArray *animateImageArray;

@end

@implementation XNRefreshFooter

- (void)prepare {
    [super prepare];
    self.state = MJRefreshStateNoMoreData;
    [self xn_initSubViews];
}

- (void)xn_initSubViews {
    UIImageView *loadImageView = [[UIImageView alloc] initWithImage:XNImage(@"sl0001")];
    [self addSubview:loadImageView];
    [loadImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@(66.7 * kScaleX));
        make.height.equalTo(@(40 * kScaleX));
    }];
    _animateImageView = loadImageView;
}

#pragma mark - ☸getter and setter
- (UILabel *)stateLabel {
    if (!_stateLabel) {
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.textColor = [UIColor colorWithRGB:0xAEB0B3];
        nameLabel.font = [UIFont systemFontOfSize:12];
        nameLabel.text = @"已经到底啦~";
        [self addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.width.lessThanOrEqualTo(@(kScreenWidth / 2));
            make.height.equalTo(@(16.5 * kScaleX));
        }];
        _stateLabel = nameLabel;
    }
    return _stateLabel;
}

- (UIView *)leftLineView {
    if (!_leftLineView) {
        UIView *leftImageView = [[UIView alloc] init];
        leftImageView.backgroundColor = [UIColor colorWithRGB:0xAEB0B3];
        [self addSubview:leftImageView];
        [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.stateLabel);
            make.right.equalTo(self.stateLabel.mas_left).offset(-6 * kScaleX);
            make.height.equalTo(@(0.5));
            make.width.equalTo(@(16.5 * kScaleX));
            
        }];
        _leftLineView = leftImageView;
    }
    return _leftLineView;
}

- (UIView *)rightLineView {
    if (!_rightLineView) {
        UIView *rightImageView = [[UIView alloc] init];
        rightImageView.backgroundColor = [UIColor colorWithRGB:0xAEB0B3];
        [self addSubview:rightImageView];
        [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.stateLabel);
            make.left.equalTo(self.stateLabel.mas_right).offset(6 * kScaleX);
            make.height.equalTo(@(0.5));
            make.width.equalTo(@(16.5 * kScaleX));
        }];
        _rightLineView = rightImageView;
    }
    return _rightLineView;
}

- (NSArray *)animateImageArray  {
    if(!_animateImageArray) {
        NSMutableArray *imageArray = [[NSMutableArray array] init];
        for (NSInteger idx = 1; idx < 21; idx++) {
            NSString *imageName = [NSString stringWithFormat:@"sl%04zd", idx];
            [imageArray addObject:XNImage(imageName)];
        }
        _animateImageArray = imageArray;
    }
    return _animateImageArray;
}

#pragma mark - 🔄overwrite
- (void)setState:(MJRefreshState)state {
    [super setState:state];
    switch (state) {
        case MJRefreshStateNoMoreData:
        {
            [_animateImageView stopAnimating];
            _animateImageView.image = XNImage(@"sl0001");
            _animateImageView.hidden = YES;
            self.stateLabel.text = @"已经到底啦~";
            self.stateLabel.hidden = NO;
            self.leftLineView.hidden = NO;
            self.rightLineView.hidden = NO;
            break;
        }
        case MJRefreshStateWillRefresh: case MJRefreshStatePulling:
        {
            _animateImageView.hidden = NO;
            _stateLabel.hidden = YES;
            _leftLineView.hidden = YES;
            _rightLineView.hidden = YES;
            [_animateImageView stopAnimating];
            _animateImageView.image = XNImage(@"sl0001");
            _animateImageView.hidden = YES;
            break;
        }
        case MJRefreshStateIdle:
        {
            _animateImageView.image = XNImage(@"sl0001");
            _animateImageView.hidden = YES;
            self.stateLabel.hidden = NO;
            self.stateLabel.text = @"上拉加载更多";
            self.leftLineView.hidden = NO;
            self.rightLineView.hidden = NO;
            break;
        }
        case MJRefreshStateRefreshing:
        {
            _animateImageView.hidden = NO;
            _stateLabel.hidden = YES;
            _leftLineView.hidden = YES;
            _rightLineView.hidden = YES;
            _animateImageView.animationImages = self.animateImageArray;
            _animateImageView.animationDuration = 0.8;
            _animateImageView.animationRepeatCount = CGFLOAT_MAX;
            [_animateImageView startAnimating];
            break;
        }
        default:
            break;
    }
}


@end
