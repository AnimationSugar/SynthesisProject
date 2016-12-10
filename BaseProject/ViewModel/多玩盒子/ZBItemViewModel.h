//
//  ZBItemViewModel.h
//  BaseProject
//
//  Created by tarena on 2016/12/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface ZBItemViewModel : BaseViewModel
-(id)initWithTag:(NSString *)tag;
@property(nonatomic,strong)NSString *tag;

@property(nonatomic)NSInteger rowNumber;
/**某一个装备的名称*/
-(NSString *)itemNameForRow:(NSInteger)row;
/**某一个装备的图片URL*/
-(NSURL *)iconURLForRow:(NSInteger)row;
/**某一个装备的Id*/
-(NSInteger)itemIdForRow:(NSInteger)row;
@end
