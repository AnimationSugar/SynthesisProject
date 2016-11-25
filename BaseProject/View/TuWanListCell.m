//
//  TuWanListCell.m
//  BaseProject
//
//  Created by tarena on 2016/11/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanListCell.h"

@implementation TuWanListCell
-(UIImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [[UIImageView alloc]init];
        //保持比例填充满
        //_iconIV.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconIV;
}
-(UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc]init];
        _titleLable.font = [UIFont systemFontOfSize:16];
    }
    return _titleLable;
}
-(UILabel *)longTitleLb{
    if (!_longTitleLb) {
        _longTitleLb = [[UILabel alloc]init];
        _longTitleLb.font = [UIFont systemFontOfSize:14];
        _longTitleLb.textColor = [UIColor grayColor];
        _longTitleLb.numberOfLines = 2;
    }
    return _longTitleLb;
}
-(UILabel *)clicksNumLb{
    if (!_clicksNumLb) {
        _clicksNumLb = [[UILabel alloc]init];
        _clicksNumLb.font = [UIFont systemFontOfSize:12];
        _clicksNumLb.textColor = [UIColor lightGrayColor];
    }
    return _clicksNumLb;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.titleLable];
        [self.contentView addSubview:self.longTitleLb];
        [self.contentView addSubview:self.clicksNumLb];
        //左10 宽92，70 剧中
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(92, 70));
            make.left.mas_equalTo(10);
        }];
        [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.left.mas_equalTo(_iconIV.mas_right).mas_equalTo(8);
            make.topMargin.mas_equalTo(_iconIV.mas_topMargin).mas_equalTo(0);
        }];
        [self.longTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(_titleLable.mas_leftMargin);
            make.rightMargin.mas_equalTo(_titleLable.mas_rightMargin);
            make.top.mas_equalTo(_titleLable.mas_bottom).mas_equalTo(3);
            
        }];
        [self.clicksNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(_iconIV.mas_bottomMargin).mas_equalTo(0);
            make.rightMargin.mas_equalTo(_titleLable.mas_rightMargin);
        }];
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
