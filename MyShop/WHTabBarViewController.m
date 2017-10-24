//
//  WHTabBarViewController.m
//  MyShop
//
//  Created by 王辉 on 2017/10/24.
//  Copyright © 2017年 ronaldo. All rights reserved.
//

#import "WHTabBarViewController.h"

@interface WHTabBarViewController ()

@end

@implementation WHTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10.0f],NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10.0f],NSForegroundColorAttributeName:[UIColor colorWithRed:31.0/255.0 green:183.0/255.0 blue:242.0/255.0 alpha:1]} forState:UIControlStateSelected];
    
    //添加子控制器
    UIViewController *viewController1 = [[UIViewController alloc] init];
    viewController1.view.backgroundColor = [UIColor redColor];
    viewController1.tabBarItem.image = [UIImage imageNamed:@"菜单栏限时特卖按钮未选中状态"];
    viewController1.tabBarItem.selectedImage = [UIImage imageNamed:@"菜单栏限时特卖按钮选中状态"];
    viewController1.tabBarItem.title = @"限时购";
//    [viewController1.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10.0f],NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
//    [viewController1.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10.0f],NSForegroundColorAttributeName:[UIColor colorWithRed:31.0/255.0 green:183.0/255.0 blue:242.0/255.0 alpha:1]} forState:UIControlStateSelected];
    [self addChildViewController:viewController1];
    
    
    UIViewController *viewController2 = [[UIViewController alloc] init];
    viewController2.view.backgroundColor = [UIColor blueColor];
    viewController2.tabBarItem.image = [UIImage imageNamed:@"菜单栏分类按钮未选中状态"];
    viewController2.tabBarItem.selectedImage = [UIImage imageNamed:@"菜单栏分类按钮选中状态"];
    viewController2.tabBarItem.title = @"分类";
    [self addChildViewController:viewController2];
    
    UIViewController *viewController3 = [[UIViewController alloc] init];
    viewController3.view.backgroundColor = [UIColor orangeColor];
    viewController3.tabBarItem.image = [UIImage imageNamed:@"菜单栏购物车按钮未选中状态"];
    viewController3.tabBarItem.selectedImage = [UIImage imageNamed:@"菜单栏购物车按钮选中状态"];
    viewController3.tabBarItem.title = @"购物车";
    [self addChildViewController:viewController3];
    
    UIViewController *viewController4 = [[UIViewController alloc] init];
    viewController4.view.backgroundColor = [UIColor greenColor];
    viewController4.tabBarItem.image = [UIImage imageNamed:@"菜单栏我的按钮未选中状态"];
    viewController4.tabBarItem.selectedImage = [UIImage imageNamed:@"菜单栏我的按钮选中状态"];
    viewController4.tabBarItem.title = @"我的";
    [self addChildViewController:viewController4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
