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
    if (hours<24) {
        return [NSString stringWithFormat:@"%ld小时前",hours];
    }
    //秒数转天数
    NSInteger days = delta/3600/24;
    return [NSString stringWithFormat:@"%ld天前",days];
}
/**获取某行播放量*/
-(NSString *)playCountForRow:(NSInteger)row{
    //如果超过万  显示xx.xx万
    NSInteger count = [self modelForRow:row].playtimes;
    if (count<10000) {
        return @([self modelForRow:row].playtimes).stringValue;
    }else{
        return [NSString stringWithFormat:@"%.1f万",count/10000.0];
    }
    
}
/**获取某行喜欢数*/
-(NSString *)favorCountForRow:(NSInteger)row{
    return @([self modelForRow:row].likes).stringValue;
}
/**获取某行评论数*/
-(NSString *)commentCountForRow:(NSInteger)row{
    return @([self modelForRow:row].comments).stringValue;
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




















