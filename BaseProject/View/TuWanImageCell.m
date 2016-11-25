//
//  TuWanImageCell.m
//  BaseProject
//
//  Created by tarena on 2016/11/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanImageCell.h"

@implementation TuWanImageCell
-(UILabel *)titileLb{
    if (!_titileLb) {
        _titileLb  = [[UILabel alloc]init];
        _titileLb.font = [UIFont systemFontOfSize:16];
    }
    return _titileLb;
}
-(UILabel *)clicksNumLb{
    if (!_clicksNumLb) {
        _clicksNumLb = [[UILabel alloc]init];
        _clicksNumLb.font = [UIFont systemFontOfSize:12];
        _clicksNumLb.textColor = [UIColor lightGrayColor];
        _clicksNumLb.textAlignment = NSTextAlignmentRight;
    }
    return _clicksNumLb;
}
-(TRImageView *)iconIV0{
    if (!_iconIV0) {
        _iconIV0 = [[TRImageView alloc]init];
        
    }
    return _iconIV0;
}
-(TRImageView *)iconIV1{
    if (!_iconIV1) {
        _iconIV1 = [[TRImageView alloc]init];
        //_iconIV1.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconIV1;
}
-(TRImageView *)iconIV2{
    if (!_iconIV2) {
        _iconIV2 = [[TRImageView alloc]init];
        //_iconIV2.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconIV2;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titileLb];
        [self.contentView addSubview:self.clicksNumLb];
        [self.contentView addSubview:self.iconIV0];
        [self.contentView addSubview:self.iconIV1];
        [self.contentView addSubview:self.iconIV2];
        [self.titileLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_equalTo(_clicksNumLb.mas_left).mas_equalTo(-10);
            
        }];
        [self.clicksNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.mas_equalTo(_titileLb.mas_centerY);
            make.bottom.mas_equalTo(_titileLb.mas_bottom).mas_equalTo(-1);
            make.right.mas_equalTo(-10);
            make.width.mas_greaterThanOrEqualTo(40);
            make.width.mas_lessThanOrEqualTo(70);
        }];
        [self.iconIV0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(88);
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(_titileLb.mas_bottom).mas_equalTo(5);
            
        }];
        [self.iconIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_iconIV0);
            make.left.mas_equalTo(_iconIV0.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(_iconIV0);
        }];
        [self.iconIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_iconIV0);
            make.left.mas_equalTo(_iconIV1.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(_iconIV0);
            make.right.mas_equalTo(-10);
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
