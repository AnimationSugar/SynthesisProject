//
//  BestGroupViewController.h
//  BaseProject
//
//  Created by tarena on 2016/12/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>


/*
 1)创建BestGroupViewModel
   1.1）只需要实现getData就行了，没有分页
   1.2）model只提供英雄enName，需要拼接英雄头像链接地址
  2）创建bestGroupCell
    五个头像中间间隔等分
 题目最多一行
 详情简介最多二行
 选中后显示浅黄色
  3）BestGroupVC
   cell高度：只需要实现estimatedHeightForRow协议，自动适配
  4）在BaikeViewController的cell点击事件中判断  vm层tag值是best_group即可跳转
 
 */
@interface BestGroupViewController : UIViewController

@end
