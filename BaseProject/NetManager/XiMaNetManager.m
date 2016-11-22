//
//  XiMaNetManager.m
//  BaseProject
//
//  Created by tarena on 2016/11/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XiMaNetManager.h"
#define kRankListPath @"http://mobile.ximalaya.com/mobile/discovery/v1/rankingList/album"
#define kAlbumPath @"http://mobile.ximalaya.com/mobile/others/ca/album/track/%@/true/%@/20"

@implementation XiMaNetManager
+(id)getRankListWithPageId:(NSInteger)pageId completionHandle:(void (^)(id, NSError *))completionHandle{
    //只能使用单独传参的方式，使用地址+参数字符串  会导致程序崩溃
    NSDictionary *params = @{@"device":@"iPhone", @"key":@"ranking:album:played:1:2", @"pageId":@(pageId), @"pageSize": @20, @"position": @0, @"title": @"排行榜"};
    return [self GET:kRankListPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([RankingListModel objectWithKeyValues:responseObj],error);
    }];
}
+(id)getAlbumWithId:(NSInteger)ID page:(NSInteger)pageId completionHandle:(void (^)(id, NSError *))completionHandle{
    //%@end已经拼入宏定义kAlbumPath中
    NSString *path = [NSString stringWithFormat:kAlbumPath,@(ID),@(pageId)];
    return [self GET:path parameters:@{@"device":@"iPhone"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([AlbumModel objectWithKeyValues:responseObj],error);
    }];
}

@end
