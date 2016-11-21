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

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
    //NSString *path = @"http://cache.tuwan.com/app/?appid=1&class=heronews&mod=八卦&appid=1&appver=2.1";
    NSString *path = @"http://cache.tuwan.com/app/";
    NSDictionary *params  =  @{@"appid":@1,@"class":@"heronews",@"mod":@"八卦",@"appver":@2.1};
    [BaseNetManager GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        TuWanModel *model = [TuWanModel objectWithKeyValues:responseObj];
        DDLogVerbose(@".......");
    }];

    return YES;
}

@end
