//
//  BaseNetManager.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

static AFHTTPSessionManager *manager = nil;

@implementation BaseNetManager

+ (AFHTTPSessionManager *)sharedAFManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", nil];
    });
    return manager;
}
//将path和参数拼接起来，并将字符串中的中文转换成百分号形式，因为有的服务器不接受中文编码
+(NSString *)percentPathWithPath:(NSString *)path params:(NSDictionary *)params{
    //http://cache.tuwan.com/app/?appid=1&class=heronews&mod=八卦&appid=1&appver=2.1
    NSMutableString *percentPath = [NSMutableString stringWithString:path];
    NSArray *keys = params.allKeys;
    NSInteger count = keys.count;
    //OC语言的特性是runtime，实际上我们调用一个方法，底层操作是在一个方法列表中搜索你调用的方法所在的地址，然后调用完毕之后把这个方法名转移到常用方法列表。所以如果再次执行某个方法时就在常用方法列表中搜索调用，效率更高
    for (int i = 0; i< count; i++) {
        if (i == 0) {
            [percentPath appendFormat:@"?%@=%@",keys[i],params[keys[i]]];
        }else{
            [percentPath appendFormat:@"&%@=%@",keys[i],params[keys[i]]];
        }
    }
    //吧字符串的中文转换成%形式
    return [percentPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
}

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    path = [self percentPathWithPath:path params:params];
    
    //打印网络请求， DDLog  与  NSLog 功能一样
    DDLogVerbose(@"Request Path: %@, Params:%@", path, params);
    return [[self sharedAFManager] GET:path parameters:params success:^void(NSURLSessionDataTask * task, id responseObject) {
        complete(responseObject, nil);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        complete(nil, error);
    }];
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    return [[self sharedAFManager] POST:path parameters:params success:^void(NSURLSessionDataTask * task, id responseObject) {
        complete(responseObject, nil);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        [self handleError:error];
        complete(nil, error);
    }];
}



+ (void)handleError:(NSError *)error{
    [[self new] showErrorMsg:error]; //弹出错误信息
}

@end
