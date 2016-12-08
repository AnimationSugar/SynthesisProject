//
//  XiMaAlbumViewmodel.m
//  BaseProject
//
//  Created by tarena on 2016/12/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XiMaAlbumViewmodel.h"

@implementation XiMaAlbumViewmodel
-(NSInteger)rowNumber{
    return  self.dataArr.count;
}
-(BOOL)isHasMore{
    return _maxPageId>_pageId;
}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    if (self.isHasMore) {
        _pageId +=1;
        [self getDataFromNetCompleteHandle:completionHandle];
    }else{
        NSError *error = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多数据"}];
        completionHandle(error);
    }
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [XiMaNetManager getAlbumWithId:_albumId page:_pageId completionHandle:^(AlbumModel *model, NSError *error) {
        if (_pageId == 1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.tracks.list];
        _maxPageId = model.tracks.maxPageId;
        completionHandle(error);
    }];
}

-(id)initWithAlbumId:(NSInteger)albumId{
    if (self = [super init]) {
        self.albumId = albumId;
    }
    return self;
}

-(AlbumTracksListModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}


/**获取某行的封面图片URL*/
-(NSURL *)coverURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].coverSmall];
}
/**获取某行题目*/
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
/**获取某行作者*/
-(NSString *)sourceForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"by %@",[self modelForRow:row].nickname];
}
/**获取某行更新时间*/
-(NSString *)timeForRow:(NSInteger)row{
    //获取当前时间
    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
    //计算当前时间和创建时间之间的差值
    NSTimeInterval delta = currentTime-[self modelForRow:row].createdAt/1000;
    //秒数转小时
    NSInteger hours = delta/3600;
    //秒数转天数
    NSInteger days = delta/3600/24;
    //秒数转年
    NSInteger years = delta/3600/24/365;
    
    if (hours<24) {
        return [NSString stringWithFormat:@"%ld小时前",hours];
    }else if(days<365){
        return [NSString stringWithFormat:@"%ld天前",days];
    }else{
        return [NSString stringWithFormat:@"%ld年前",years];
    }
}
/**获取某行播放量*/
-(NSString *)playCountForRow:(NSInteger)row{
    //如果超过千  显示xx.xx千  超过百万 显示xx.x百万
    NSInteger count = [self modelForRow:row].playtimes;
    if (count>1000000) {
        return [NSString stringWithFormat:@"%.1f百万",count/1000000.0];
    }else if (count>1000){
       return [NSString stringWithFormat:@"%.1f千",count/1000.0];
    }else{
        return @([self modelForRow:row].playtimes).stringValue;
    }
}
/**获取某行喜欢数*/
-(NSString *)favorCountForRow:(NSInteger)row{
    NSInteger count = [self modelForRow:row].likes;
    if (count>1000000) {
        return [NSString stringWithFormat:@"%.1f百万",count/1000000.0];
    }else if (count>1000){
        return [NSString stringWithFormat:@"%.1f千",count/1000.0];
    }else{
        return @([self modelForRow:row].likes).stringValue;
    }
}
/**获取某行评论数*/
-(NSString *)commentCountForRow:(NSInteger)row{
    //如果超过千  显示xx.xx千  超过百万 显示xx.x百万
    NSInteger count = [self modelForRow:row].comments;
    if (count>1000000) {
        return [NSString stringWithFormat:@"%.1f百万",count/1000000.0];
    }else if (count>1000){
        return [NSString stringWithFormat:@"%.1f千",count/1000.0];
    }else{
        return @([self modelForRow:row].comments).stringValue;
    }
}
/**获取某行播放时长*/
-(NSString *)durationForRow:(NSInteger)row{
    NSInteger duration   = [self modelForRow:row].duration;
    NSInteger minute = duration/60;
    NSInteger second = duration%60;
    return [NSString stringWithFormat:@"%02ld:%02ld",minute,second];
}
/**获取下载链接地址*/
-(NSURL *)dowloadURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].downloadUrl];
}
/**获取某行音频播放地址*/
-(NSURL *)musicURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].playUrl64];
}






@end




















