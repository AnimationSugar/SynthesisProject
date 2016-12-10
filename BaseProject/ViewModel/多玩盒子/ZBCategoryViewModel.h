//
//  ZBCategoryViewModel.h
//  BaseProject
//
//  Created by tarena on 2016/12/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface ZBCategoryViewModel : BaseViewModel
-(NSInteger)rowNumber;
/**某行的标记值*/
-(NSString *)tagForRow:(NSInteger)row;
/**某行的文字*/
-(NSString *)textForRow:(NSInteger)row;
@end
