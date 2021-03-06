//
//  TuWanViewModel.m
//  BaseProject
//
//  Created by tarena on 2016/11/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanViewModel.h"

@implementation TuWanViewModel
-(instancetype)initWithType:(InfoType)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}
//预防性编程，防止没有使用指定的初始化方法
-(id)init{
    if (self = [super init]) {
        //如果使用此方法初始化，会出崩溃提示
        NSAssert(NO, @"%s 不许使用initWithType初始化",__func__);
        
    }
    return self;
}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _start += 11;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [TuWanNetManager getTuWanInfoWithType:_type start:_start completionHandle:^(TuWanModel * model, NSError *error) {
        if (_start == 0) {
            [self.dataArr removeAllObjects];
            self.indexPicArr = nil;
        }
        [self.dataArr addObjectsFromArray:model.data.list];
        self.indexPicArr = model.data.indexpic;
        completionHandle(error);
    }];
    
}
//下部行数据
-(NSString *)titleForRowInList:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].title;
}
-(NSURL *)iconURLForRowInList:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].litpic];
}
-(NSString *)descForRowInList:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].longtitle;
}
-(NSString *)clicksForRowInList:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].click stringByAppendingString:@"人浏览"];
}
-(NSURL *)detailURLForRowInList:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].html5];
}
//头部展示栏
-(NSInteger)indexPicNumber{
    return self.indexPicArr.count;
}
-(NSURL *)iconURLForRowInIndexPic:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.indexPicArr row:row].litpic];
}
-(NSString *)titleForRowInIndexPic:(NSInteger)row{
    return [self modelForArr:self.indexPicArr row:row].title;
}
-(NSURL *)detailURLForRowInIndexPic:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.indexPicArr row:row].html5];
}

//通过行数返回此行中的对应的图片链接地址
-(NSArray *)iconURLSForRowInList:(NSInteger)row{
    NSArray *arr = [self modelForArr:self.dataArr row:row].showitem;
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i<arr.count; i++) {
        TuWanDataIndexpicShowitemModel *model   = arr[i];
        [array addObject:[NSURL URLWithString:model.pic]];
    }
    return [array copy];
}

//判断详细内容的显示种类
/** 判断数据类型是视频  video*/
-(BOOL)isVideoInListForRow:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].type isEqualToString:@"video"];
}
-(BOOL)isVideoInIndexPicForRow:(NSInteger)row{
    return [[self modelForArr:self.indexPicArr row:row].type isEqualToString:@"video"];
}
/** 判断数据类型是图片  pic*/
-(BOOL)isPicInListForRow:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].type isEqualToString:@"pic"];
}
-(BOOL)isPicInIndexPicForRow:(NSInteger)row{
    return [[self modelForArr:self.indexPicArr row:row].type isEqualToString:@"pic"];
}
/** 判断数据类型是Html  all*/
-(BOOL)isHtmlInListForRow:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].type isEqualToString:@"all"];
}
-(BOOL)isHtmlInIndexPicForRow:(NSInteger)row{
    return [[self modelForArr:self.indexPicArr row:row].type isEqualToString:@"all"];
}
/**返回某行数据的Aid*/
-(NSString *)aidInListForRow:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].aid;
}
-(NSString *)aidInIndexPicForRow:(NSInteger)row{
    return [self modelForArr:self.indexPicArr row:row].aid;
}


//返回当前头部是否为空
-(BOOL)isExistIndexPic{
    return self.indexPicArr !=nil  && self.indexPicArr.count != 0;
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(TuWanDataIndexpicModel *)modelForArr:(NSArray *)arr row:(NSInteger)row{
    return arr[row];
}

//根据showType的值  0表示没图， 表示有图
-(BOOL)containImages:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].showtype isEqualToString:@"1"];
}
@end












