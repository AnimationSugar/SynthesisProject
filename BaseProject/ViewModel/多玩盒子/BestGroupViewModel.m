//
//  BestGroupViewModel.m
//  BaseProject
//
//  Created by tarena on 2016/12/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BestGroupViewModel.h"
#import "DuoWanNetManager.h"
@implementation BestGroupViewModel
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuoWanNetManager getHeroBestGroupCompletionHandle:^(id model, NSError *error) {
        if (!error) {
            self.dataArr = model;
        }
        completionHandle(error);
    }];
}

-(BestGroupModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

/**最佳阵容标题*/
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
/**对于最佳阵容的描述*/
-(NSString *)descForRow:(NSInteger)row{
    return [self modelForRow:row].des;
}

/**英雄头像URL数组*/
-(NSArray *)iconsURLForRow:(NSInteger)row{
    return @[kIconPathWithEnName([self modelForRow:row].hero1),
             kIconPathWithEnName([self modelForRow:row].hero2),
             kIconPathWithEnName([self modelForRow:row].hero3),
             kIconPathWithEnName([self modelForRow:row].hero4),
             kIconPathWithEnName([self modelForRow:row].hero5)
             ];
}
/**英雄描述数组*/
-(NSArray *)descsForRow:(NSInteger)row{
    return @[[self modelForRow:row].des1,
             [self modelForRow:row].des2,
             [self modelForRow:row].des3,
             [self modelForRow:row].des4,
             [self modelForRow:row].des5];
}


@end
