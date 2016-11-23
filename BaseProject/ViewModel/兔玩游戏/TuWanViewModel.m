//
//  TuWanViewModel.m
//  BaseProject
//
//  Created by tarena on 2016/11/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanViewModel.h"

@implementation TuWanViewModel
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _start += 11;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getDataCompletionHandle:(CompletionHandle)completionHandle{
    //self.dataTask = [];
    
}

@end
