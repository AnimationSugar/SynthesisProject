//
//  XiMaCategoryCell.h
//  BaseProject
//
//  Created by tarena on 2016/11/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface XiMaCategoryCell : UITableViewCell
/**序号标签*/
@property(nonatomic,strong)UILabel *orderLb;
/**类型图片*/
@property(nonatomic,strong)TRImageView *iconIV;
/**类型名称*/
@property(nonatomic,strong)UILabel *titleLb;
/**类型描述*/
@property(nonatomic,strong)UILabel *descLb;
/**集数*/
@property(nonatomic,strong)UILabel *numberlb;
/**集数图标*/
@property(nonatomic,strong)TRImageView *numberIV;
@end
