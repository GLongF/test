//
//  MYTabBarViewController.m
//  100s
//
//  Created by 郭龙飞 on 16/7/10.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYTabBarViewController.h"
#import "MYMainViewController.h"
#import "MYVoiceViewController.h"
#import "MYMeViewController.h"
#import "MYTabBar.h"
@interface MYTabBarViewController ()

@end

@implementation MYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置所有UITabBarItem的文字属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [self setupChildVc:[[MYMainViewController alloc] init] title:@"首页" ];
    [self setupChildVc:[[MYVoiceViewController alloc] init] title:@"voice"];
    [self setupChildVc:[[MYMeViewController alloc] init] title:@"我的"];
    
    // 更换tabBar
    [self setValue:[[MYTabBar alloc] init] forKeyPath:@"tabBar"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title{
    // 设置文字和图片
    UINavigationController *naC = [[UINavigationController alloc] initWithRootViewController:vc];
    naC.tabBarItem.title = title;
    naC.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1.0];

    [self addChildViewController:naC];
    //[self addChildViewController:vc];
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
