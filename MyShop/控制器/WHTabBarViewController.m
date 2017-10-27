//
//  WHTabBarViewController.m
//  MyShop
//
//  Created by 王辉 on 2017/10/24.
//  Copyright © 2017年 ronaldo. All rights reserved.
//

#import "WHTabBarViewController.h"
#import "WHNavigationController.h"

@interface WHTabBarViewController ()

/** 用来存储从plist文件中获取的数据 **/
@property(nonatomic,strong) NSArray *tabBarMessageArray;

@end

@implementation WHTabBarViewController

- (NSArray *)tabBarMessageArray{
 
    if (!_tabBarMessageArray) {
        _tabBarMessageArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"WHTabBarViewController" ofType:@"plist"]];
    }
    return _tabBarMessageArray;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:@{
                                         NSFontAttributeName:[UIFont systemFontOfSize:10.0f],
                                         NSForegroundColorAttributeName:[UIColor grayColor]
                                         } forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:@{
                                         NSFontAttributeName:[UIFont systemFontOfSize:10.0f],
                                         NSForegroundColorAttributeName:[UIColor colorWithRed:31.0/255.0 green:183.0/255.0 blue:242.0/255.0 alpha:1]
                                         } forState:UIControlStateSelected];
    
    //添加子控制器
    for (NSDictionary *dict in self.tabBarMessageArray) {
        Class viewControllerClass = NSClassFromString(dict[@"tabBarController"]);
        UIViewController *viewController = [[viewControllerClass alloc] init];
        viewController.tabBarItem.image = [UIImage imageNamed:dict[@"tabBarImage"]];
        viewController.tabBarItem.selectedImage = [UIImage imageNamed:dict[@"tabBarSelectedImage"]];
//        viewController.tabBarItem.title = dict[@"tabBarTitle"];
        viewController.title = dict[@"tabBarTitle"];
        WHNavigationController *navigationController = [[WHNavigationController alloc] initWithRootViewController:viewController];
        [self addChildViewController:navigationController];
    }
    
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
