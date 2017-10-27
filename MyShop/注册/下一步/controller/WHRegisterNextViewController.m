//
//  WHRegisterNextViewController.m
//  MyShop
//
//  Created by 王辉 on 2017/10/27.
//  Copyright © 2017年 ronaldo. All rights reserved.
//

#import "WHRegisterNextViewController.h"
#import "WHRegisterNextView.h"

@interface WHRegisterNextViewController ()

//注册下一步view
@property(nonatomic,strong) WHRegisterNextView *registerNextView;

@end

@implementation WHRegisterNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = mainColor;
    self.edgesForExtendedLayout = 0;
    self.title = @"验证手机号";
    
    [self.view addSubview:self.registerNextView];
    __weak typeof(self) weakSelf = self;
    [_registerNextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(@150);
    }];
    
    WHLog(@"用户名和密码:%@",_userMessageDict);
    
}

- (WHRegisterNextView *)registerNextView{
    if (!_registerNextView) {
        _registerNextView = [[WHRegisterNextView alloc] init];
    }
    return _registerNextView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
