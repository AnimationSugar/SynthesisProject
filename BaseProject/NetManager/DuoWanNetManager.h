//
//  DuoWanNetManager.h
//  BaseProject
//
//  Created by tarena on 2016/11/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "DuoWanModel.h"
//只要共用一个解析类的请求，就可以合起来写，只需要使用枚举变量。来决定不同的请求地址即可

typedef NS_ENUM(NSUInteger,HeroType){
    HeroTypeFree,//免费英雄
    HeroTypeAll, //全部英雄
};
@interface DuoWanNetManager : BaseNetManager
//使用/**内容*/方式添加注释，可以让你的代码被调用时出现代码提示
/**
 *  获取免费英雄或收费英雄列表，因为收费英雄和免费英雄的请求串非常相似，所以可以合写
 *
 *  @param type 请求英雄类型
 *
 *  @return 当前请求所在任务
 */
+(id)getHeroWithType:(HeroType)type kCompletionHandle;
/**
 *  获取英雄皮肤
 *
 *  @param heroName 要获取英雄皮肤的英文皮肤
 *
 *  @return 请求所在任务
 */
+(id)getHeroSkinsWithHeroName:(NSString *)heroName kCompletionHandle;
/**
 *  获取英雄配音
 *
 *  @param heroname 要获取的英雄的英文名称
 *
 *  @return 请求所在任务
 */
+(id)getHeroSoundWithHeroName:(NSString *)heroname kCompletionHandle;
/**
 *  获取英雄相关视频
 *
 *  @param page   视频页数 最小为1
 *  @param enName 英雄英文名
 *
 *  @return 网络请求任务
 */
+(id)getHeroVideosWithPage:(NSInteger)page tag:(NSString *)enName kCompletionHandle;
/**
 *  获取英雄出装
 *
 *  @param enName 英雄英文名
 *
 *  @return 网络请求任务
 */
+(id)getHeroCZWithHeroName:(NSString *)enName kCompletionHandle;
/** 获取英雄资料*/
+(id)getHeroDetailWithHeroName:(NSString *)enName kCompletionHandle;
/** 获取英雄的天赋和符文*/
+(id)getHeroGiftAndRun:(NSString *)enName kCompletionHandle;
/** 获取英雄改动*/
+(id)getHeroInfoWithHeroName:(NSString *)enName kCompletionHandle;
/** 获取英雄一周数据*/
+(id)getWeekDataWithHeroId:(NSInteger)heroId kCompletionHandle;
/** 获取游戏百科列表*/
+(id)getToolMenuCompletionHandle:(void(^)(id model,NSError *error))completionHandle;
/** 获取装备分类*/
+(id)getZBCantegoryCompletionHandle:(void(^)(id model,NSError *error))completionHandle;
/** 获取某分类装备列表*/
+(id)getZBItemListWithTag:(NSString *)tag kCompletionHandle;
/** 装备详情*/
+(id)getItemDetailWithItemId:(NSInteger)itemId kCompletionHandle;
/** 获取天赋树*/
+(id)getGiftCompletionHandle:(void(^)(id model,NSError *error))completionHandle;
/** 获取符文列表*/
+(id)getRunesCompletionHandle:(void(^)(id model,NSError *error))completionHandle;
/** 获取召唤师技能*/
+(id)getSumAbilityCompletionHandle:(void(^)(id model,NSError *error))completionHandle;
/** 获取最佳整容*/
+(id)getHeroBestGroupCompletionHandle:(void(^)(id model,NSError *error))completionHandle;



@end
