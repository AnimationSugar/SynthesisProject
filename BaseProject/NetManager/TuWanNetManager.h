//
//  TuWanNetManager.h
//  BaseProject
//
//  Created by tarena on 2016/11/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TuWanModel.h"
#import "TuWanVideoModel.h"
#import "TuWanPicModel.h"
//只要共用一个解析类的请求，就可以合起来写，只需要使用枚举变量，来决定不同的请求地址即可
typedef NS_ENUM(NSUInteger,InfoType) {
    InfoTypeTouTiao,      //头条
    InfoTypeDuJia,         //独家
    InfoTypeAnHei3,//暗黑3
    InfoTypeMoShou,//魔兽
    InfoTypeFengBao,//风暴
    InfoTypeLuShi,//炉石
    InfoTypeXingJi2,//星际2
    InfoTypeShouWang,//守望
    InfoTypeTuPian,//图片
    InfoTypeShiPing,//视频
    InfoTypeGongLue,//攻略
    InfoTypeHuanHua,//幻化
    InfoTypeQuWen,//趣闻
    InfoTypeCos,//COS
    InfoTypeMeiNv//美女
    
};
@interface TuWanNetManager : BaseNetManager
/**
 *  获取某种类型的资讯·
 *
 *  @param type  资讯类型
 *  @param start 当前资讯起始的索引值 0+
 *
 *  @return 请求所在任务
 */
+(id)getTuWanInfoWithType:(InfoType)type start:(NSInteger)start kCompletionHandle;
/**
 *  获取视频类资讯的详情页
 *
 *  @param aid 资讯aid
 *
 *  @return 任务
 */
+(id)getVideoDetailWithId:(NSString *)aid kCompletionHandle;
/**
 *  获取图片类资讯的详情页
 *
 *  @param aid 资讯aid
 *
 *  @return 任务
 */
+(id)getpicDetailWithId:(NSString *)aid kCompletionHandle;
@end
