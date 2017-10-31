//
//  WHRegisterNextViewController.m
//  MyShop
//
//  Created by 王辉 on 2017/10/27.
//  Copyright © 2017年 ronaldo. All rights reserved.
//

#import "WHRegisterNextViewController.h"
#import "WHRegisterNextView.h"//注册下一步view
#import <AFNetworking.h>

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
    
    [self addController];
    [self requestCodeNumber];
    WHLog(@"用户名和密码:%@",_userMessageDict);
}
//加载控件
- (void)addController{
    [self.view addSubview:self.registerNextView];
    __weak typeof(self) weakSelf = self;
    [_registerNextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(@150);
    }];
}
//请求验证码
- (void)requestCodeNumber{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    //http://123.57.141.249:8080/beautalk/appMember/createCode.do
    [manager POST:@"http://123.57.141.249:8080/beautalk/appMember/createCode.do" parameters:@{@"MemberId":_userMessageDict[@"username"]} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        WHLog(@"responseObject:%@",responseObject);
        if ([responseObject[@"result"] isEqualToString:@"sucess"]) {
            [self.registerNextView GCDTime];
        }else if ([responseObject[@"result"] isEqualToString:@"TelephoneExistError"]){
            WHLog(@"手机号已近被注册");
        }else{
            WHLog(@"验证码请求失败");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        WHLog(@"error:%@",error);
    }];
}

- (WHRegisterNextView *)registerNextView{
    if (!_registerNextView) {
        _registerNextView = [[WHRegisterNextView alloc] init];
        _registerNextView.phoneNumString = _userMessageDict[@"username"];
    }
    return _registerNextView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
