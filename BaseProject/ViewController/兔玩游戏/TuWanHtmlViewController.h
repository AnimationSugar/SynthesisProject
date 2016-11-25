//
//  TuWanHtmlViewController.h
//  BaseProject
//
//  Created by tarena on 2016/11/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanHtmlViewController : UIViewController
-(id)initWithURL:(NSURL *)url;
@property(nonatomic,strong)NSURL *url;
@end
