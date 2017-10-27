//
//  WHRegisterNextView.m
//  MyShop
//
//  Created by 王辉 on 2017/10/27.
//  Copyright © 2017年 ronaldo. All rights reserved.
//

#import "WHRegisterNextView.h"

@interface WHRegisterNextView()<UITextFieldDelegate>

//提示验证码发送到哪个手机号码的label
@property(nonatomic,strong) UILabel *tishiLabel;
//背景label
@property(nonatomic,strong) UILabel *backLabel;
//验证码输入框
@property(nonatomic,strong) UITextField *codeText;
//显示倒计时button
@property(nonatomic,strong) UIButton *timeBtn;
//竖分割线
@property(nonatomic,strong) UILabel *lineLabel;
//注册button
@property(nonatomic,strong) UIButton *registerBtn;

@end

@implementation WHRegisterNextView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tishiLabel];
        [self addSubview:self.backLabel];
        [self addSubview:self.codeText];
        [self addSubview:self.timeBtn];
        [self addSubview:self.lineLabel];
        [self addSubview:self.registerBtn];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    [_tishiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(weakSelf);
        make.height.mas_equalTo(@35);
        make.left.equalTo(weakSelf.mas_left).offset(15);
    }];
    [_backLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@44);
        make.top.equalTo(weakSelf.tishiLabel.mas_bottom);
        make.left.equalTo(weakSelf.mas_left).offset(-1);
        make.right.equalTo(weakSelf.mas_right).offset(1);
    }];
    [_codeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(weakSelf.backLabel);
        make.left.equalTo(weakSelf.backLabel.mas_left).offset(15);
        make.right.equalTo(weakSelf.backLabel.mas_right).offset(VIEW_WIDTH - 120);
    }];
    [_timeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 40));
        make.centerY.equalTo(weakSelf.codeText.mas_centerY);
        make.right.equalTo(weakSelf.mas_right);
    }];
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(1, 30));
        make.centerY.equalTo(weakSelf.codeText.mas_centerY);
        make.right.equalTo(weakSelf.timeBtn.mas_left).offset(-1);
    }];
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.codeText.mas_bottom).offset(15);
        make.left.equalTo(weakSelf.mas_left).offset(16);
        make.right.equalTo(weakSelf.mas_right).offset(-16);
        make.height.mas_equalTo(@35);
    }];
}

- (UILabel *)tishiLabel{
    if (!_tishiLabel) {
        _tishiLabel = [[UILabel alloc] init];
        _tishiLabel.text = @"验证码已发送到  +86";
        _tishiLabel.font = [UIFont systemFontOfSize:12.0];
    }
    return _tishiLabel;
}
- (UILabel *)backLabel{
    if (!_backLabel) {
        _backLabel = [[UILabel alloc] init];
        _backLabel.backgroundColor = [UIColor whiteColor];
        _backLabel.layer.borderColor = RGB(188, 188, 188).CGColor;
        _backLabel.layer.borderWidth = 1;
    }
    return _backLabel;
}
- (UITextField *)codeText{
    if (!_codeText) {
        _codeText = [[UITextField alloc] init];
        _codeText.delegate = self;
        _codeText.placeholder = @"请输入验证码";
        [_codeText addTarget:self action:@selector(codeTextChangeText:) forControlEvents:UIControlEventEditingChanged];
    }
    return _codeText;
}
- (UIButton *)timeBtn{
    if (!_timeBtn) {
        _timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_timeBtn setTitle:@"30秒后重试" forState:UIControlStateNormal];
        [_timeBtn setTitleColor:RGB(188, 188, 188) forState:UIControlStateNormal];
    }
    return _timeBtn;
}
- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.backgroundColor = RGB(188, 188, 188);
    }
    return _lineLabel;
}
- (UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registerBtn.backgroundColor = RGB(229, 229, 229);
        _registerBtn.userInteractionEnabled = NO;
        [_registerBtn setTitleColor:RGB(132, 132, 132) forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        _registerBtn.selected = NO;
    }
    return _registerBtn;
}

- (void)codeTextChangeText:(UITextField *)textField{
    if (textField.text.length == 6) {
        _registerBtn.backgroundColor = RGB(56, 166, 241);
        _registerBtn.userInteractionEnabled = YES;
        _registerBtn.selected = YES;
    }else{
        _registerBtn.backgroundColor = RGB(229, 229, 229);
        _registerBtn.userInteractionEnabled = NO;
        _registerBtn.selected = NO;
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (range.location == 6) {
        return NO;
    }
    return YES;
}


@end
