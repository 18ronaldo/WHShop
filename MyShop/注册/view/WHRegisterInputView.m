//
//  WHRegisterInputView.m
//  MyShop
//
//  Created by 王辉 on 2017/10/27.
//  Copyright © 2017年 ronaldo. All rights reserved.
//

#import "WHRegisterInputView.h"

@interface WHRegisterInputView()<UITextFieldDelegate>

/**提示label*/
@property(nonatomic,strong) UILabel *tishiLabel;
/**输入框文本背景*/
@property(nonatomic,strong) UILabel *textBackLabel;
/**手机号text*/
@property(nonatomic,strong) UITextField *userNameText;
/**密码text*/
@property(nonatomic,strong) UITextField *passwordText;
/**输入框文本分割线*/
@property(nonatomic,strong) UILabel *textLineLabel;
/**下一步button*/
@property(nonatomic,strong) UIButton *nextBtn;
/**去登录button*/
@property(nonatomic,strong) UIButton *goLoginBtn;

@end

@implementation WHRegisterInputView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tishiLabel];
        [self addSubview:self.textBackLabel];
        [self addSubview:self.userNameText];
        [self addSubview:self.passwordText];
        [self addSubview:self.textLineLabel];
        [self addSubview:self.nextBtn];
        [self addSubview:self.goLoginBtn];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    [_tishiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@35);
        make.top.right.equalTo(weakSelf);
        make.left.equalTo(weakSelf).offset(15);
    }];
    [_textBackLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.tishiLabel.mas_bottom);
        make.left.equalTo(weakSelf.mas_left).offset(-1);
        make.right.equalTo(weakSelf.mas_right).offset(1);
        make.height.mas_equalTo(@89);
    }];
    [_userNameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.height.equalTo(@44);
        make.top.equalTo(weakSelf.textBackLabel.mas_top);
    }];
    [_passwordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.height.equalTo(@44);
        make.bottom.equalTo(weakSelf.textBackLabel.mas_bottom);
    }];
    [_textLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@1);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.centerY.equalTo(weakSelf.textBackLabel.mas_centerY);
    }];
    [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(16);
        make.right.equalTo(weakSelf.mas_right).offset(-16);
        make.height.equalTo(@35);
        make.top.equalTo(weakSelf.passwordText.mas_bottom).offset(15);
    }];
    [_goLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 16));
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.top.equalTo(weakSelf.nextBtn.mas_bottom).offset(23);
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
- (UILabel *)textBackLabel{
    if (!_textBackLabel) {
        _textBackLabel = [[UILabel alloc] init];
        _textBackLabel.backgroundColor = [UIColor whiteColor];
        _textBackLabel.layer.borderWidth = 1;
        _textBackLabel.layer.borderColor = RGB(188, 188, 188).CGColor;
    }
    return _textBackLabel;
}
- (UITextField *)userNameText{
    if (!_userNameText) {
        _userNameText = [[UITextField alloc] init];
        _userNameText.delegate = self;
        _userNameText.placeholder = @"请输入手机号码";
        [_userNameText addTarget:self action:@selector(userNameTextChangeText:) forControlEvents:UIControlEventEditingChanged];
    }
    return _userNameText;
}
- (UITextField *)passwordText{
    if (!_passwordText) {
        _passwordText = [[UITextField alloc] init];
        _passwordText.delegate = self;
        _passwordText.placeholder = @"设置账号密码";
        [_passwordText addTarget:self action:@selector(passwordTextChangeText:) forControlEvents:UIControlEventEditingChanged];
    }
    return _passwordText;
}
- (UILabel *)textLineLabel{
    if (!_textLineLabel) {
        _textLineLabel = [[UILabel alloc] init];
        _textLineLabel.backgroundColor = RGB(188, 188, 188);
    }
    return _textLineLabel;
}
- (UIButton *)nextBtn{
    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        _nextBtn.backgroundColor = RGB(229, 229, 229);
        [_nextBtn setTitleColor:RGB(132, 132, 132) forState:UIControlStateNormal];
        _nextBtn.userInteractionEnabled = NO;
        [_nextBtn addTarget:self action:@selector(pushNextViewController) forControlEvents:UIControlEventTouchUpInside];
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
#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField == _userNameText && range.location > 10) {
        return NO;
    }
    return YES;
}
#pragma mark - textChange
//用户名修改内容时调用的方法
- (void)userNameTextChangeText:(UITextField *)textField{
    if (textField.text.length == 11 && _passwordText.text.length > 5) {
        _nextBtn.backgroundColor = RGB(56, 165, 241);
        _nextBtn.userInteractionEnabled = YES;
    }else{
        _nextBtn.backgroundColor = RGB(229, 229, 229);
        _nextBtn.userInteractionEnabled = NO;
    }
}
//密码输入框修改内容时调用的方法
- (void)passwordTextChangeText:(UITextField *)textField{
    if (_userNameText.text.length == 11 && textField.text.length > 5) {
        _nextBtn.backgroundColor = RGB(56, 165, 241);
        _nextBtn.userInteractionEnabled = YES;
    }else{
        _nextBtn.backgroundColor = RGB(229, 229, 229);
        _nextBtn.userInteractionEnabled = NO;
    }
}
- (void)pushNextViewController{
    WHLog(@"fasdgfg");
}


@end
