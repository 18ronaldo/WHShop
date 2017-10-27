//
//  WHMyViewController.m
//  MyShop
//
//  Created by 王辉 on 2017/10/24.
//  Copyright © 2017年 ronaldo. All rights reserved.
//

#import "WHMyViewController.h"
#import "WHMyMessageTableView.h"//我的页面展示功能的tableView
#import "WHMyHeadView.h"//我的页面tableView顶部展示登录注册的View
#import "WHRegisterViewController.h"//注册页面

@interface WHMyViewController ()

/** 顶部登录和注册的view **/
@property(nonatomic,strong) WHMyHeadView *headView;

@property(nonatomic,strong) WHMyMessageTableView *messageTable;   /**展示功能列表*/

@end

@implementation WHMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置顶部开始的地方。。。
    self.edgesForExtendedLayout = 0;
    self.view.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1];
    [self.view addSubview:self.headView];
    [self.view addSubview:self.messageTable];
    
    [self addAutoLayout];
}
- (void)addAutoLayout{
    __weak typeof(self) weakSelf = self;
    //给顶部登录注册View添加约束
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(150);
    }];
    //给tableView添加约束
    [_messageTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.headView.mas_bottom).offset(35);
        make.height.mas_equalTo(176);
    }];
}
- (WHMyHeadView *)headView{
    if (!_headView) {
        _headView = [[WHMyHeadView alloc] init];
        __weak typeof(self) weakSelf = self;
        _headView.registerBlock = ^{
            WHRegisterViewController *registerView = [[WHRegisterViewController alloc] init];
            [weakSelf.navigationController pushViewController:registerView animated:YES];
        };
    }
    return _headView;
}
- (WHMyMessageTableView *)messageTable{
    if (!_messageTable) {
        _messageTable = [[WHMyMessageTableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
    }
    return _messageTable;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
