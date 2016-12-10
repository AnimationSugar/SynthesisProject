//
//  ZBItemViewController.h
//  BaseProject
//
//  Created by tarena on 2016/12/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface ZBItemViewController : UIViewController

-(id)initWithTag:(NSString *)tag name:(NSString *)name;
@property(nonatomic,strong)NSString *tag;

@end
@interface ZBItemCell : UICollectionViewCell
@property(nonatomic,strong)TRImageView *iconView;
@property(nonatomic,strong)UILabel *nameLb;


@end
