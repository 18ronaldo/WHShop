//
//  WHRegisterViewController.m
//  MyShop
//
//  Created by 王辉 on 2017/10/26.
//  Copyright © 2017年 ronaldo. All rights reserved.
//

#import "WHRegisterViewController.h"
#import "WHRegisterInputView.h"
#import "WHThirdLoginView.h"

@interface WHRegisterViewController ()

//注册用户名密码输入的View
@property(nonatomic,strong) WHRegisterInputView *registerInputView;
//第三方登录View
@property(nonatomic,strong) WHThirdLoginView *thirdLoginView;

@end

@implementation WHRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = mainColor;
    self.edgesForExtendedLayout = 0;
    self.title = @"注册";
    
    //添加控件
    [self addController];
}
//添加控件
- (void)addController{
    [self.view addSubview:self.registerInputView];
    [self.view addSubview:self.thirdLoginView];
    
    __weak typeof(self) weakSelf = self;
    [_registerInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(@230);
    }];
    [_thirdLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.registerInputView.mas_bottom);
        make.left.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(@85);
    }];
}

- (WHRegisterInputView *)registerInputView{
    if (!_registerInputView) {
        _registerInputView = [[WHRegisterInputView alloc] init];
    }
    return _registerInputView;
}
- (WHThirdLoginView *)thirdLoginView{
    if (!_thirdLoginView) {
        _thirdLoginView = [[WHThirdLoginView alloc] init];
    }
    return _thirdLoginView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
