//
//  TuWanPicViewModel.m
//  BaseProject
//
//  Created by tarena on 2016/11/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanPicViewModel.h"
#import "TuWanNetManager.h"
@implementation TuWanPicViewModel
-(id)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        self.aid = aid;
    }
    return self;
}
//防御性编程，不允熙使用init初始化
-(id)init{
    if (self = [super init]) {
        NSAssert1(NO, @"%s必须使用initWithAid初始化", __func__);
    }
    return self;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [TuWanNetManager getpicDetailWithId:_aid completionHandle:^(id model, NSError *error) {
        self.picModel = model;
        completionHandle(error);
    }];
}
-(NSInteger)rowNumber{
    return self.picModel.content.count;
}
-(NSURL *)picURLForRow:(NSInteger)row{
    TuWanPicContentModel *model = self.picModel.content[row];
    return [NSURL URLWithString:model.pic];
}
@end
