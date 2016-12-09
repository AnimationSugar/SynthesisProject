//
//  ToolMenuViewModel.m
//  BaseProject
//
//  Created by tarena on 2016/12/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ToolMenuViewModel.h"

@implementation ToolMenuViewModel
/**不是分页，只实现getData即可*/
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuoWanNetManager getToolMenuCompletionHandle:^(id model, NSError *error) {
        self.dataArr = model;
        completionHandle(error);
    }];
    
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(ToolMenuModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
/**某行的图标URL*/
-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].icon];
}
/**某行的题目*/
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}
/**某行的数据类型--枚举类型*/
-(ToolMenuItemType)itemTypeForRow:(NSInteger)row{
    NSString *type = [self modelForRow:row].type;
    if ([type isEqualToString:@"native"]) {
        return ToolMenuItemTypeNative;
    }
    if ([type isEqualToString:@"web"]) {
        return ToolMenuItemTypeWeb;
    }
    return 0;
}
/**某行的tag值*/
-(NSString *)tagForRow:(NSInteger)row{
    return [self modelForRow:row].tag;
}
/**网页类型的链接地址*/
-(NSURL *)webURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].url];
}


@end
