//
//  XiMaNetManager.h
//  BaseProject
//
//  Created by tarena on 2016/11/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "XiMaLaYaModel.h"
@interface XiMaNetManager : BaseNetManager
/**
 *  获取音乐分类列表 top50
 *
 *  @param pageId 从当前页数从1开始
 *
 *  @return 返回当前请求所在的任务
 */
+(id)getRankListWithPageId:(NSInteger)pageId kCompletionHandle;
/**
 *  根据音乐组类型ID获取对应音乐列表。
 *
 *  @param ID     音乐组ID
 *  @param pageId 当前页数  1+
 *
 *  @return 返回当前请求所在任务
 */
+(id)getAlbumWithId:(NSInteger)ID page:(NSInteger)pageId kCompletionHandle;
@end
