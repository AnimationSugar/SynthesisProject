//
//  TuWanViewController.h
//  BaseProject
//
//  Created by tarena on 2016/11/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanViewController : UIViewController
//内容页的首页是单例的，每一次进程都只能初始化一次
+(UINavigationController *)standarTuWanNavi;
@end
