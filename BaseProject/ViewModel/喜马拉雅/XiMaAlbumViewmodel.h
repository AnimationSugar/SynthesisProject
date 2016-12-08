//
//  XiMaAlbumViewmodel.h
//  BaseProject
//
//  Created by tarena on 2016/12/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiMaNetManager.h"

@interface XiMaAlbumViewmodel : BaseViewModel
/**专门的初始化方法*/
-(instancetype)initWithAlbumId:(NSInteger)albumId;
@property(nonatomic) NSInteger albumId;

/**行数*/
@property(nonatomic)NSInteger rowNumber;

/**当前请求页数*/
@property(nonatomic)NSInteger pageId;
/**最大页数*/
@property(nonatomic)NSInteger maxPageId;
/**是否有更多页*/
@property(nonatomic,getter=isHasMore) BOOL hasMore;


/**获取某行的封面图片URL*/
-(NSURL *)coverURLForRow:(NSInteger)row;
/**获取某行题目*/
-(NSString *)titleForRow:(NSInteger)row;
/**获取某行作者*/
-(NSString *)sourceForRow:(NSInteger)row;
/**获取某行更新时间*/
-(NSString *)timeForRow:(NSInteger)row;
/**获取某行播放量*/
-(NSString *)playCountForRow:(NSInteger)row;
/**获取某行喜欢数*/
-(NSString *)favorCountForRow:(NSInteger)row;
/**获取某行评论数*/
-(NSString *)commentCountForRow:(NSInteger)row;
/**获取某行播放时长*/
-(NSString *)durationForRow:(NSInteger)row;
/**获取下载链接地址*/
-(NSURL *)dowloadURLForRow:(NSInteger)row;
/**获取某行音频播放地址*/
-(NSURL *)musicURLForRow:(NSInteger)row;



@end
