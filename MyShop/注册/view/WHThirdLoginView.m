//
//  WHThirdLoginView.m
//  MyShop
//
//  Created by 王辉 on 2017/10/27.
//  Copyright © 2017年 ronaldo. All rights reserved.
//

#import "WHThirdLoginView.h"


@interface WHThirdLoginView()

/**分割线*/
@property(nonatomic,strong) UILabel *lineLabel;
/**一键登录label*/
@property(nonatomic,strong) UILabel *oneLogin;
/**qq登录button*/
@property(nonatomic,strong) UIButton *qqLogin;
/**微信登录button*/
@property(nonatomic,strong) UIButton *wxLogin;
/**新浪登录button*/
@property(nonatomic,strong) UIButton *sinaLogin;

@end

@implementation WHThirdLoginView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.lineLabel];
        [self addSubview:self.oneLogin];
        [self addSubview:self.qqLogin];
        [self addSubview:self.wxLogin];
        [self addSubview:self.sinaLogin];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    [_oneLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 20));
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(weakSelf.mas_top);
    }];
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@1);
        make.centerY.equalTo(weakSelf.oneLogin.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(16);
        make.right.equalTo(weakSelf.mas_right).offset(-16);
    }];
    [_wxLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(45, 45));
        make.top.equalTo(weakSelf.oneLogin.mas_bottom).offset(20);
    }];
    [_qqLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(45, 45));
        make.top.equalTo(weakSelf.oneLogin.mas_bottom).offset(20);
        make.right.equalTo(weakSelf.wxLogin.mas_left).offset(-(VIEW_WIDTH - 135) / 4);
    }];
    
    [_sinaLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(45, 45));
        make.top.equalTo(weakSelf.oneLogin.mas_bottom).offset(20);
        make.left.equalTo(weakSelf.wxLogin.mas_right).offset((VIEW_WIDTH - 135) / 4);
    }];
}
- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.backgroundColor = RGB(190, 190, 190);
    }
    return _lineLabel;
}
- (UILabel *)oneLogin{
    if (!_oneLogin) {
        _oneLogin = [[UILabel alloc] init];
        _oneLogin.text = @"一键登录";
        _oneLogin.textColor = RGB(190, 190, 190);
        _oneLogin.textAlignment = NSTextAlignmentCenter;
        _oneLogin.font = [UIFont systemFontOfSize:16.0];
        _oneLogin.backgroundColor = mainColor;
    }
    return _oneLogin;
}
- (UIButton *)qqLogin{
    if (!_qqLogin) {
        _qqLogin = [UIButton buttonWithType:UIButtonTypeCustom];
        [_qqLogin setImage:[UIImage imageNamed:@"登录界面qq登陆"] forState:UIControlStateNormal];
    }
    return _qqLogin;
}
- (UIButton *)wxLogin{
    if (!_wxLogin) {
        _wxLogin = [UIButton buttonWithType:UIButtonTypeCustom];
        [_wxLogin setImage:[UIImage imageNamed:@"登录界面微信登录"] forState:UIControlStateNormal];
    }
    return _wxLogin;
}
-(UIButton *)sinaLogin{
    if (!_sinaLogin) {
        _sinaLogin = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sinaLogin setImage:[UIImage imageNamed:@"登陆界面微博登录"] forState:UIControlStateNormal];
    }
    return _sinaLogin;
}

@end
