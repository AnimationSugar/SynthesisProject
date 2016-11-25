//
//  TuWanImageCell.h
//  BaseProject
//
//  Created by tarena on 2016/11/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface TuWanImageCell : UITableViewCell
/**  题目标签*/
@property(nonatomic,strong)UILabel *titileLb;
/**  点击数标签*/
@property(nonatomic,strong)UILabel *clicksNumLb;
/**  图片1*/
@property(nonatomic,strong)TRImageView *iconIV0;
/**  图片2*/
@property(nonatomic,strong)TRImageView *iconIV1;
/**  图片3*/
@property(nonatomic,strong)TRImageView *iconIV2;


@end
