//
//  WHRegisterViewController.m
//  MyShop
//
//  Created by 王辉 on 2017/10/26.
//  Copyright © 2017年 ronaldo. All rights reserved.
//

#import "WHRegisterViewController.h"

@interface WHRegisterViewController ()<UITextFieldDelegate>

@property(nonatomic,strong) UILabel *tishiLabel;   /**提示label*/
@property(nonatomic,strong) UITextField *userNameText;   /**手机号text*/
@property(nonatomic,strong) UITextField *passwordText;   /**密码text*/
@property(nonatomic,strong) UIButton *nextBtn;   /**下一步button*/
@property(nonatomic,strong) UIButton *goLoginBtn;   /**去登录button*/
@property(nonatomic,strong) UILabel *lineLabel;   /**分割线*/
@property(nonatomic,strong) UILabel *oneLogin;   /**一键登录label*/
@property(nonatomic,strong) UIButton *qqLogin;   /**qq登录button*/
@property(nonatomic,strong) UIButton *wxLogin;   /**微信登录button*/
@property(nonatomic,strong) UIButton *sinaLogin;   /**新浪登录button*/

@end

@implementation WHRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = mainColor;
    self.edgesForExtendedLayout = 0;
    [self.view addSubview:self.tishiLabel];
    [self.view addSubview:self.userNameText];
    [self.view addSubview:self.passwordText];
    [self.view addSubview:self.nextBtn];
    [self.view addSubview:self.goLoginBtn];
    [self.view addSubview:self.lineLabel];
    [self.view addSubview:self.oneLogin];
    [self.view addSubview:self.qqLogin];
    [self.view addSubview:self.wxLogin];
    [self.view addSubview:self.sinaLogin];
    
    __weak typeof(self) weakSelf = self;
    [_tishiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@35);
        make.top.right.equalTo(weakSelf.view);
        make.left.equalTo(weakSelf.view).offset(15);
    }];
    [_userNameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@44);
        make.top.equalTo(weakSelf.tishiLabel.mas_bottom);
    }];
    [_passwordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@44);
        make.top.equalTo(weakSelf.userNameText.mas_bottom);
    }];
    [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).offset(16);
        make.right.equalTo(weakSelf.view.mas_right).offset(-16);
        make.height.equalTo(@35);
        make.top.equalTo(weakSelf.passwordText.mas_bottom).offset(15);
    }];
    [_goLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 16));
        make.right.equalTo(weakSelf.view.mas_right).offset(-15);
        make.top.equalTo(weakSelf.nextBtn.mas_bottom).offset(23);
    }];
    [_oneLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 20));
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.top.equalTo(weakSelf.nextBtn.mas_bottom).offset(57);
    }];
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@1);
        make.centerY.equalTo(weakSelf.oneLogin.mas_centerY);
        make.left.equalTo(weakSelf.view.mas_left).offset(16);
        make.right.equalTo(weakSelf.view.mas_right).offset(-16);
    }];
    [_wxLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view.mas_centerX);
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

- (UILabel *)tishiLabel{
    if (!_tishiLabel) {
        _tishiLabel = [[UILabel alloc] init];
        _tishiLabel.text = @"请输入手机号码注册新用户";
        _tishiLabel.font = [UIFont systemFontOfSize:14.0];
        _tishiLabel.textColor = RGB(81, 81, 81);
    }
    return _tishiLabel;
}
- (UITextField *)userNameText{
    if (!_userNameText) {
        _userNameText = [[UITextField alloc] init];
        _userNameText.delegate = self;
        _userNameText.placeholder = @"请输入手机号码";
        _userNameText.backgroundColor = [UIColor whiteColor];
    }
    return _userNameText;
}
- (UITextField *)passwordText{
    if (!_passwordText) {
        _passwordText = [[UITextField alloc] init];
        _passwordText.delegate = self;
        _passwordText.placeholder = @"设置账号密码";
        _passwordText.backgroundColor = [UIColor whiteColor];
    }
    return _passwordText;
}
- (UIButton *)nextBtn{
    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        _nextBtn.backgroundColor = RGB(229, 229, 229);
        [_nextBtn setTitleColor:RGB(132, 132, 132) forState:UIControlStateNormal];
    }
    return _nextBtn;
}
- (UIButton *)goLoginBtn{
    if (!_goLoginBtn) {
        _goLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goLoginBtn setTitle:@"去登录" forState:UIControlStateNormal];
        [_goLoginBtn setTitleColor:RGB(56, 165, 241) forState:UIControlStateNormal];
        _goLoginBtn.backgroundColor = mainColor;
    }
    return _goLoginBtn;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
