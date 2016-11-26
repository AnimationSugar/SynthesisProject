//
//  XiMaCategoryViewModel.m
//  BaseProject
//
//  Created by tarena on 2016/11/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XiMaCategoryViewModel.h"

@implementation XiMaCategoryViewModel
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
// 当前页数已经是最大页数，则不需要再请求数据
    if (_maxPageId <= _pageId) {
        NSError *err = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey: @"没有更多数据"}];
        
        completionHandle(err);
        return;
    }
    _pageId+=1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [XiMaNetManager getRankListWithPageId:_pageId completionHandle:^(RankingListModel * model, NSError *error) {
        if(!error){
            if (_pageId == 1) {
                [self.dataArr removeAllObjects];
            }
            [self.dataArr addObjectsFromArray:model.list];
            _maxPageId = model.maxPageId;
        }
        completionHandle(error);
    }];
}

-(RankListListModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}

/**某条数据的图片URL*/
-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].albumCoverUrl290];
}
/**某条数据的题目*/
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
/**某条数据的描述*/
-(NSString *)descForRow:(NSInteger)row{
    return [self modelForRow:row].intro;
}
/**某条数据的集数*/
-(NSString *)numberForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%ld集",[self modelForRow:row].tracks];
}
/**当前页数对应的数据ID*/
-(NSInteger)albumIdForRow:(NSInteger)row{
    return [self modelForRow:row].albumId;
}

@end
