//
//  ZBDetailViewModel.m
//  BaseProject
//
//  Created by tarena on 2016/12/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZBDetailViewModel.h"

@implementation ZBDetailViewModel
-(id)initWithEquipId:(NSInteger)equipId{
    if (self = [super init]) {
        self.equipId = equipId;
    }
    return self;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask  = [DuoWanNetManager getItemDetailWithItemId:self.equipId completionHandle:^(id model, NSError *error) {
        self.model = model;
        completionHandle(error);
    }];
}
-(NSString *)nameFromModel{
    return self.model.name;
}
-(NSString *)descFromModel{
    return self.model.desc;
}
-(NSString *)priceFromModel{
    return [NSString stringWithFormat:@"升级价格:%ld 总价格:%ld 出售价格:%ld",self.model.price,self.model.allPrice,self.model.sellPrice];
}
-(NSArray *)needArrayFromModel{
    //将字符串从，号的地方切割成数组
    return [self.model.need componentsSeparatedByString:@","];
}
-(NSArray *)composeArrayFromModel{
    return [self.model.compose componentsSeparatedByString:@","]; 
}
@end
