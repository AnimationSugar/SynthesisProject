//
//  BaseNetManager.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kCompletionHandle completionHandle:(void(^)(id model, NSError *error))completionHandle

@interface BaseNetManager : NSObject

//对AFNetWorking的GET请求进行封装
+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete;

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete;
/**
 *  为了应付某些服务器对于中文不支持夫人情况，需要转化字符串为带%号的形式
 *
 *  @param path   请求路径   ？前面的部分
 *  @param params 请求的参数  ？后面的部分
 *
 *  @return 转化 路径+参数  拼接出的字符串中的中文为%号的形式
 */
+(NSString *)percentPathWithPath:(NSString *)path params:(NSDictionary *)params;
@end
