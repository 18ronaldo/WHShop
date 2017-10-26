//
//  WHMyViewController.m
//  MyShop
//
//  Created by 王辉 on 2017/10/24.
//  Copyright © 2017年 ronaldo. All rights reserved.
//

#import "WHMyViewController.h"
#import "WHMyMessageTableViewCell.h"//列表中的自定义cell

@interface WHMyViewController ()<UITableViewDelegate,UITableViewDataSource>

/** 顶部登录和注册的view **/
@property(nonatomic,strong) UIView *headView;
/** 顶部背景图片 **/
@property(nonatomic,strong) UIImageView *headBackImage;
/** 登录按钮 **/
@property(nonatomic,strong) UIButton *loginBtn;
/** 注册按钮 **/
@property(nonatomic,strong) UIButton *registerBtn;
@property(nonatomic,strong) UITableView *messageTable;   /**展示功能列表*/

@property(nonatomic,strong) NSArray *messageTableSource;   /**message列表需要展示的数据源*/

@end

@implementation WHMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置顶部开始的地方。。。
    self.edgesForExtendedLayout = 0;
    self.view.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1];
    
    [self.view addSubview:self.headView];
    [self.headView addSubview:self.headBackImage];
    [self.headView addSubview:self.loginBtn];
    [self.headView addSubview:self.registerBtn];
    [self.view addSubview:self.messageTable];
    
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
    [_messageTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.headView.mas_bottom).offset(35);
        make.height.mas_equalTo(176);
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
- (UITableView *)messageTable{
    if (!_messageTable) {
        _messageTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _messageTable.delegate = self;
        _messageTable.dataSource =self;
//        继承UIScrollView的bounces属性禁止滚动
        _messageTable.bounces = NO;
    }
    return _messageTable;
}
- (NSArray *)messageTableSource{
    if (!_messageTableSource) {
        _messageTableSource = @[@{@"image":@"我的界面我的收藏图标",@"title":@"我的收藏"},
                                @{@"image":@"我的界面意见反馈图标",@"title":@"意见反馈"},
                                @{@"image":@"我的界面关于我们图标",@"title":@"关于我们"},
                                @{@"image":@"我的界面客服热线图标",@"title":@"客服热线"},
                                @{@"image":@"我的界面我的优惠券图标",@"title":@"我的优惠卷"},
                                @{@"image":@"我的界面邀请好友图标",@"title":@"邀请好友，立刻赚钱"}
                                ];
    }
    return _messageTableSource;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WHMyMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[WHMyMessageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.sourceDict = self.messageTableSource[indexPath.row];
    
    if (indexPath.row == 3) {
        UIImageView *nextImage = [cell valueForKey:@"nextImage"];
        nextImage.hidden = YES;
        
        UILabel *phoneNum = [[UILabel alloc] init];
        phoneNum.textColor = RGB(123, 124, 128);
        phoneNum.text = @"400-100-111";
        [cell addSubview:phoneNum];
        
        __weak typeof(cell) weakSelf = cell;
        [phoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(weakSelf.mas_centerY);
            make.right.equalTo(weakSelf.mas_right);
            make.size.mas_equalTo(CGSizeMake(120, 15));
        }];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"我选中的是滴%li",indexPath.row);
}



@end
