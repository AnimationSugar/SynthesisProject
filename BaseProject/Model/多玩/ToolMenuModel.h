//
//  ToolMenuModel.h
//  BaseProject
//
//  Created by jiyingxin on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface ToolMenuModel : BaseModel

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *tag;
//自动解析出来的没有这个属性，需要手动添加
@property (nonatomic, copy) NSString *url;

@end








