//
//  DuoWanTabBarController.m
//  BaseProject
//
//  Created by tarena on 2016/11/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DuoWanTabBarController.h"
#import "HeroViewController.h"
#import "BaiKeViewController.h"
#import "SearchViewController.h"
@interface DuoWanTabBarController ()

@end

@implementation DuoWanTabBarController

+(DuoWanTabBarController *)standardInstance{
    static DuoWanTabBarController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [DuoWanTabBarController new];
    });
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //取消工具栏的透明状态
    self.tabBar.translucent = NO;
    //self.tabBar.hidden = YES;
    //初始化三个子视图，放到TabBar
    HeroViewController *heroVC = [HeroViewController new];
    SearchViewController *searchVC = [SearchViewController new];
    BaiKeViewController *baikeVC = [BaiKeViewController new];
    UINavigationController *heroNavi = [[UINavigationController alloc]initWithRootViewController:heroVC];
    UINavigationController *searchNavi = [[UINavigationController alloc]initWithRootViewController:searchVC];
    UINavigationController *baikeNavi = [[UINavigationController alloc]initWithRootViewController:baikeVC];
    self.viewControllers = @[heroNavi,baikeNavi,searchNavi];
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
