//
//  ZBDetailViewModel.h
//  BaseProject
//
//  Created by tarena on 2016/12/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface ZBDetailViewModel : BaseViewModel
@property(nonatomic,strong)ItemDetailModel *model;
-(NSString *)nameFromModel;
-(NSString *)descFromModel;
-(NSString *)priceFromModel;
-(NSArray *)needArrayFromModel;
-(NSArray *)composeArrayFromModel;
@property(nonatomic,assign)NSInteger equipId;
-(id)initWithEquipId:(NSInteger)equipId;


@end
