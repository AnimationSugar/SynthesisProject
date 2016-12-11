//
//  SumAbilityViewModel.h
//  BaseProject
//
//  Created by tarena on 2016/12/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface SumAbilityViewModel : BaseViewModel
@property(nonatomic)NSInteger rowNumber;
/**返回某行的数据类型，主要用于给详情页传值*/
-(SumAbilityModel *)modelForRow:(NSInteger)row;
-(NSString *)titleForRow:(NSInteger)row;
-(NSURL *)iconURLForRow:(NSInteger)row;
@end
