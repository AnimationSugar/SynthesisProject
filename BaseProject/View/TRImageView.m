//
//  TRImageView.m
//  BaseProject
//
//  Created by tarena on 2016/11/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRImageView.h"

@implementation TRImageView

-(id)init{
    if (self = [super init]) {
        _imageView = [UIImageView new];
        [self addSubview:_imageView];
        //按比例充满
        _imageView.contentMode = 2;
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        //当前视图剪掉超出自身区域的视图
        self.clipsToBounds = YES;
    }
    return self;
}

@end
