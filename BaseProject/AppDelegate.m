//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "BaseNetManager.h"
#import "TuWanModel.h"
#import "LeftViewController.h"
#import "TuWanViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
-(UIWindow *)window{
    if (!_window) {
        _window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
        
    }
    return _window;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    //测试代码
    //NSString *path = @"http://cache.tuwan.com/app/?appid=1&class=heronews&mod=八卦&appid=1&appver=2.1";
//    NSString *path = @"http://cache.tuwan.com/app/";
//    NSDictionary *params  =  @{@"appid":@1,@"class":@"heronews",@"mod":@"八卦",@"appver":@2.1};
//    [BaseNetManager GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
//        TuWanModel *model = [TuWanModel objectWithKeyValues:responseObj];
//        DDLogVerbose(@".......");
//    }];
    [self configGlobalUIStyle];
    self.window.rootViewController = self.sideMenu;
    return YES;
}

/**配置全局UI的样式——>导航栏*/
-(void)configGlobalUIStyle{
    /**  导航栏不透明 */
    [[UINavigationBar appearance] setTranslucent:NO];
    /**  设置导航栏背景图 */
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg_64"] forBarMetrics:UIBarMetricsDefault];
    /**   配置导航栏题目的样式*/
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont flatFontOfSize:kNaviTitleFontSize],NSForegroundColorAttributeName:kNaviTitleColor}];
}

//代码重构，将代码结构更加清晰 合理 方便维护
-(RESideMenu *)sideMenu{
    if (!_sideMenu) {
        _sideMenu = [[RESideMenu alloc]initWithContentViewController:[TuWanViewController standarTuWanNavi] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        //为sidmenu设置背景图
        _sideMenu.backgroundImage = [UIImage imageNamed:@"10979716_0800"];
        //可以让出现菜单时不显示菜单栏
        _sideMenu.menuPrefersStatusBarHidden = YES;
    }
    return _sideMenu;
}

@end
