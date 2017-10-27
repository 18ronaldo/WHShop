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
        [self GCDTime];
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

- (void)setPhoneNumString:(NSString *)phoneNumString{
    _phoneNumString = phoneNumString;
    _tishiLabel.attributedText = [self makeTishiLabelAttributed];
//    [_timeBtn setAttributedTitle:[self makeTimeButtonAttributed] forState:UIControlStateNormal];
}
//制作tishiLabel的属性文本
- (NSMutableAttributedString *)makeTishiLabelAttributed{
    NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc] initWithString:@"验证码已发送到" attributes:@{NSForegroundColorAttributeName:RGB(139, 139, 139)}];
    NSMutableAttributedString *str2 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@" +86 %@",_phoneNumString] attributes:@{NSForegroundColorAttributeName:RGB(56, 166, 243)}];
    [str1 insertAttributedString:str2 atIndex:str1.length];
    return str1;
}
//制作TimeButton的属性文本
- (NSMutableAttributedString *)makeTimeButtonAttributed:(NSInteger)time{
    NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%li",time] attributes:@{NSForegroundColorAttributeName:RGB(56, 166, 243)}];
    NSMutableAttributedString *str2 = [[NSMutableAttributedString alloc] initWithString:@"秒后重试" attributes:@{NSForegroundColorAttributeName:RGB(139, 139, 139)}];
    [str1 insertAttributedString:str2 atIndex:str1.length];
    return str1;
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
        [_timeBtn addTarget:self action:@selector(GCDTime) forControlEvents:UIControlEventTouchUpInside];
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
#pragma mark - time计时器
- (void)GCDTime{
    __block NSInteger time = 60;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (time < 1) {
            dispatch_source_cancel(timer);
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"重新发送" attributes:@{NSForegroundColorAttributeName:RGB(56, 166, 243)}];
            dispatch_async(dispatch_get_main_queue(), ^{
                _timeBtn.userInteractionEnabled = YES;
                [_timeBtn setAttributedTitle:string forState:UIControlStateNormal];
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                _timeBtn.userInteractionEnabled = NO;
                [_timeBtn setAttributedTitle:[self makeTimeButtonAttributed:time] forState:UIControlStateNormal];
            });
            time--;
        }
    });
    dispatch_resume(timer);
}


@end
