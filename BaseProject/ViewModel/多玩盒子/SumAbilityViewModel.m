//
//  SumAbilityViewModel.m
//  BaseProject
//
//  Created by tarena on 2016/12/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "SumAbilityViewModel.h"

@implementation SumAbilityViewModel
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [DuoWanNetManager getSumAbilityCompletionHandle:^(id model, NSError *error) {
        if (!error) {
            self.dataArr = model;
        }
        completionHandle(error);
    }];
}
-(SumAbilityModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}
-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%@.png", [self modelForRow:row].ID]];
}
@end
