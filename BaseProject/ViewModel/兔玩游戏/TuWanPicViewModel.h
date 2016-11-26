//
//  TuWanPicViewModel.h
//  BaseProject
//
//  Created by tarena on 2016/11/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"
@interface TuWanPicViewModel : BaseViewModel
/**必须使用下方初始化方法*/
-(id)initWithAid:(NSString *)aid;
/**  aid 的赋值应该是非空的，使用xcode7新加入的非空标识*/
@property(nonatomic,strong)NSString *aid;

@property(nonatomic)NSInteger rowNumber;
-(NSURL *)picURLForRow:(NSInteger)row;
@property(nonatomic,strong)TuWanPicModel *picModel;
@end
