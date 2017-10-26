//
//  WHMyViewController.m
//  MyShop
//
//  Created by 王辉 on 2017/10/24.
//  Copyright © 2017年 ronaldo. All rights reserved.
//

#import "WHMyViewController.h"
#import <Masonry.h>

@interface WHMyViewController ()

/** 顶部登录和注册的view **/
@property(nonatomic,strong) UIView *headView;
/** 顶部背景图片 **/
@property(nonatomic,strong) UIImageView *headBackImage;
/** 登录按钮 **/
@property(nonatomic,strong) UIButton *loginBtn;
/** 注册按钮 **/
@property(nonatomic,strong) UIButton *registerBtn;

@end

@implementation WHMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置顶部开始的地方。。。
    self.edgesForExtendedLayout = 0;
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:self.headView];
    [self.headView addSubview:self.headBackImage];
    [self.headView addSubview:self.loginBtn];
    [self.headView addSubview:self.registerBtn];
    
    __weak typeof(self) weakSelf = self;
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(150);
    }];
    [_headBackImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.headView);
    }];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.headView.mas_centerX).offset(-60);
        make.centerY.equalTo(weakSelf.headView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(45, 23));
    }];
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.headView.mas_centerX).offset(60);
        make.centerY.equalTo(weakSelf.headView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(45, 23));
    }];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)headView{
    if (!_headView) {
        _headView = [[UIView alloc] init];
    }
    return _headView;
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
    }
    return _loginBtn;
}
- (UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:18.0f];
        _registerBtn.titleLabel.textColor = [UIColor whiteColor];
    }
    return _registerBtn;
}



@end
