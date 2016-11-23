//
//  TuWanViewModel.h
//  BaseProject
//
//  Created by tarena on 2016/11/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"
@interface TuWanViewModel : BaseViewModel
//当前页数的索引值
@property(nonatomic)NSInteger start;

//当前行数
@property(nonatomic)NSInteger rowNumber;

@end
