//
//  WHMyMessageTableView.m
//  MyShop
//
//  Created by 王辉 on 2017/10/26.
//  Copyright © 2017年 ronaldo. All rights reserved.
//

#import "WHMyMessageTableView.h"
#import "WHMyMessageTableViewCell.h"//列表中的自定义cell

@interface WHMyMessageTableView()<UITableViewDelegate,UITableViewDataSource>

/**message列表需要展示的数据源*/
@property(nonatomic,strong) NSArray *messageTableSource;

@end

@implementation WHMyMessageTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource =self;
        //继承UIScrollView的bounces属性禁止滚动
        self.bounces = NO;
    }
    return self;
}

- (NSArray *)messageTableSource{
    if (!_messageTableSource) {
//        _messageTableSource = @[@{@"image":@"我的界面我的收藏图标",@"title":@"我的收藏"},
//                                @{@"image":@"我的界面意见反馈图标",@"title":@"意见反馈"},
//                                @{@"image":@"我的界面关于我们图标",@"title":@"关于我们"},
//                                @{@"image":@"我的界面客服热线图标",@"title":@"客服热线"},
//                                @{@"image":@"我的界面我的优惠券图标",@"title":@"我的优惠卷"},
//                                @{@"image":@"我的界面邀请好友图标",@"title":@"邀请好友，立刻赚钱"}
//                                ];
        _messageTableSource = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"WHMyMessageTableSource" ofType:@"plist"]];
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
