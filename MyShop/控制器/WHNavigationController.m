//
//  WHNavigationController.m
//  MyShop
//
//  Created by 王辉 on 2017/10/26.
//  Copyright © 2017年 ronaldo. All rights reserved.
//

#import "WHNavigationController.h"

@interface WHNavigationController ()

@end

@implementation WHNavigationController

//保证支队navBar只进行一次设置，保证性能
+ (void)initialize{
    //获取NavigationBar
    UINavigationBar *navBar = [[UINavigationBar alloc] init];
    [navBar setBackgroundImage:[UIImage imageNamed:@"nav_backImage"] forBarMetrics:UIBarMetricsDefault];
    //设置导航栏字体样式
    [navBar setTitleTextAttributes:@{
                                    NSForegroundColorAttributeName:[UIColor blackColor],
                                    NSFontAttributeName:[UIFont boldSystemFontOfSize:20.0f]
                                    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
