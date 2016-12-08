//
//  SearchDetailViewController.h
//  BaseProject
//
//  Created by tarena on 2016/12/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchDetailViewController : UIViewController
//专有的初始化方法，用于加载请求
-(id)initWithRequest:(NSURLRequest *)request;
@property(nonatomic,strong)NSURLRequest *request;
@end
