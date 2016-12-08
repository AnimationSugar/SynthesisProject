//
//  XiMaCategoryCell.m
//  BaseProject
//
//  Created by tarena on 2016/11/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "XiMaCategoryCell.h"

@implementation XiMaCategoryCell
-(UILabel *)orderLb{
    if (_orderLb == nil) {
        _orderLb = [[UILabel alloc]init];
        _orderLb.font = [UIFont boldSystemFontOfSize:15];
        _orderLb.textColor = [UIColor lightGrayColor];
        _orderLb.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_orderLb];
        //使用KVO观察者机制，如果text被赋值为1，颜色是。。。
        //下方方法：如果——orderLb的text属性被赋新值，则触发task
        [_orderLb bk_addObserverForKeyPath:@"text" options:NSKeyValueObservingOptionNew task:^(id obj, NSDictionary *change) {
            NSString *value = change[@"new"];
            if ([value isEqualToString:@"1"]) {
                _orderLb.textColor = kRGBColor(247, 31, 0);
            }else if ([value isEqualToString:@"2"]) {
                _orderLb.textColor = kRGBColor(246, 140, 0);
            }else if ([value isEqualToString:@"3"]) {
                _orderLb.textColor = kRGBColor(148, 183, 0);
            }
            else{
                _orderLb.textColor = kRGBColor(144, 144, 144);
            }
        }];
        [self.orderLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(35);
        }];
    }
    return _orderLb;
}

-(TRImageView *)iconIV{
    if (_iconIV == nil) {
        _iconIV = [[TRImageView alloc]init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(75, 70));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.orderLb.mas_right).mas_equalTo(0);
        }];
    }
    return _iconIV;
}

-(UILabel *)titleLb{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc]init];
        _titleLb.font = [UIFont boldSystemFontOfSize:18];
        [self.contentView addSubview:_titleLb];
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.iconIV.mas_topMargin).mas_equalTo(3);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _titleLb;
}

-(UILabel *)descLb{
    if ( _descLb == nil) {
        _descLb = [[UILabel alloc]init];
        _descLb.font = [UIFont systemFontOfSize:15];
        _descLb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _descLb;
}
-(UILabel *)numberlb{
    if (_numberlb == nil) {
        _numberlb = [[UILabel alloc]init];
        _numberlb.font = [UIFont systemFontOfSize:12];
        _numberlb.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_numberlb];
        [self.numberlb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.numberIV.mas_right).mas_equalTo(2);
            make.right.mas_equalTo(-10);
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin).mas_equalTo(-3);
            make.centerY.mas_equalTo(self.numberIV);
        }];
        
    }
    return _numberlb;
}
-(TRImageView *)numberIV{
    if (_numberIV == nil) {
        _numberIV = [[TRImageView alloc]init];
        _numberIV.imageView.image = [UIImage imageNamed:@"album_tracks"];
        [self.contentView addSubview:_numberIV];
        [self.numberIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
    }
    return _numberIV;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //右箭头样式
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //添加依赖autoLayout一定要有顺序，从左到右  从上倒下
        //分割线左间距调整
        self.separatorInset = UIEdgeInsetsMake(0, 122, 0, 0);
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
