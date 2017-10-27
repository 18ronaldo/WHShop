//
//  WHMyHeadView.m
//  MyShop
//
//  Created by 王辉 on 2017/10/26.
//  Copyright © 2017年 ronaldo. All rights reserved.
//

#import "WHMyHeadView.h"

@interface WHMyHeadView()

/** 顶部headView背景图片 **/
@property(nonatomic,strong) UIImageView *headBackImage;
/** 登录按钮 **/
@property(nonatomic,strong) UIButton *loginBtn;
/** 注册按钮 **/
@property(nonatomic,strong) UIButton *registerBtn;

@end

@implementation WHMyHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headBackImage];
        [self addSubview:self.loginBtn];
        [self addSubview:self.registerBtn];
    }
    return self;
}
- (void)layoutSubviews{
    __weak typeof(self) weakSelf = self;
    [_headBackImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX).offset(-60);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(45, 23));
    }];
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX).offset(60);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(45, 23));
    }];
}

- (UIImageView *)headBackImage{
    if (!_headBackImage) {
        _headBackImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"我的背景"]];
    }
    return _headBackImage;
}
- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:18.0f];
        _loginBtn.titleLabel.textColor = [UIColor whiteColor];
        _registerBtn.backgroundColor = [UIColor clearColor];
    }
    return _loginBtn;
}
- (UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:18.0f];
        _registerBtn.titleLabel.textColor = [UIColor whiteColor];
        [_registerBtn addTarget:self action:@selector(pushRegisterViewController) forControlEvents:UIControlEventTouchUpInside];
        _registerBtn.backgroundColor = [UIColor clearColor];
    }
    return _registerBtn;
}
- (void)pushRegisterViewController{
    if (_registerBlock) {
        _registerBlock();
    }
}

@end
