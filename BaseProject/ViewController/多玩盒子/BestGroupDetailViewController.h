//
//  BestGroupDetailViewController.h
//  BaseProject
//
//  Created by tarena on 2016/12/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 1)数据的传入  通过bestgroupVC中点击任意Cell，获取到对印的BestGroupmodel类型对象
 2）整体是一个TableView  Group类型  二个Section
 3）有二种类型的Cell  一种负责显示团队简介——不可选，
    第二中  负责角色简介——可选择
 4）需要有自定义Cell  ：BestGroupDetailCell，显示每个角色的简介
 5）cell选中以后的背景色是自定义的   保持选中状态
 6）
 */
@interface BestGroupDetailViewController : UIViewController

@end
