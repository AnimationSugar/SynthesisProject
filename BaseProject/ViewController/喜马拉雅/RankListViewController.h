//
//  RankListViewController.h
//  BaseProject
//
//  Created by tarena on 2016/11/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankListViewController : UIViewController
/**单例原因：侧边栏需要经常切换内容页，内容页不应该 随着切换被释放掉，每次切换的应该是同一个地址*/
+(UINavigationController *)defaultNavi;
@end
