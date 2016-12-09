//
//  BestGroupViewModel.h
//  BaseProject
//
//  Created by tarena on 2016/12/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "BestGroupModel.h"

//总要拼接，做宏
#define kIconPathWithEnName(enName)  [NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", enName]

@interface BestGroupViewModel : BaseViewModel
@property(nonatomic)NSInteger rowNumber;

/**最佳阵容标题*/
-(NSString *)titleForRow:(NSInteger)row;
/**对于最佳阵容的描述*/
-(NSString *)descForRow:(NSInteger)row;

/**英雄头像URL数组*/
-(NSArray *)iconsURLForRow:(NSInteger)row;
/**英雄描述数组*/
-(NSArray *)descsForRow:(NSInteger)row;
@end
