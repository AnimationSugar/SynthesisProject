//
//  TuWanListCell.h
//  BaseProject
//
//  Created by tarena on 2016/11/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface TuWanListCell : UITableViewCell
/**   左侧图片 */
@property(nonatomic,strong)TRImageView *iconIV;
/**   题目标签 */
@property(nonatomic,strong)UILabel *titleLable;
/**   长题目标签*/
@property(nonatomic,strong)UILabel *longTitleLb;
/**   点击数标签 */
@property(nonatomic,strong)UILabel *clicksNumLb;
@end
