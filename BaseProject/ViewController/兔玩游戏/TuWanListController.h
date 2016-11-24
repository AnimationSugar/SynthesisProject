//
//  TuWanListController.h
//  BaseProject
//
//  Created by tarena on 2016/11/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanListController : UITableViewController
/**
 *  接受外部传参，决定当前控制器显示哪种类型的信息
 */
@property(nonatomic,strong)NSNumber *infoType;
@end
