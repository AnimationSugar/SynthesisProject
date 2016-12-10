//
//  ZBCategoryViewModel.m
//  BaseProject
//
//  Created by tarena on 2016/12/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZBCategoryViewModel.h"

@implementation ZBCategoryViewModel
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuoWanNetManager getZBCantegoryCompletionHandle:^(id model, NSError *error) {
        if (!error) {
            self.dataArr = model;
        }
        completionHandle(error);
    }];
}
-(ZBCategoryModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}


/**某行的标记值*/
-(NSString *)tagForRow:(NSInteger)row{
    return [self modelForRow:row].tag;
}
/**某行的文字*/
-(NSString *)textForRow:(NSInteger)row{
    return [self modelForRow:row].text;
}
@end
