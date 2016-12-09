//
//  BestGroupDetailHeroCell.m
//  BaseProject
//
//  Created by tarena on 2016/12/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BestGroupDetailHeroCell.h"

@implementation BestGroupDetailHeroCell
- (UIImageView *)headIV {
    if(_headIV == nil) {
        _headIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_headIV];
        [_headIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
    }
    return _headIV;
}

- (UILabel *)descLb {
    if(_descLb == nil) {
        _descLb = [[UILabel alloc] init];
        [self.contentView addSubview:_descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            //调试，不能使用_headIV
            make.left.mas_equalTo(self.headIV.mas_right).mas_equalTo(8);
            make.top.mas_equalTo(10);
            make.right.bottom.mas_equalTo(-10);
        }];
        _descLb.numberOfLines = 0;
        _descLb.font = [UIFont systemFontOfSize:14];
    }
    return _descLb;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *yellowView = [UIView new];
        yellowView.backgroundColor = kRGBColor(254, 249, 236);
        self.selectedBackgroundView = yellowView;
        self.separatorInset = UIEdgeInsetsMake(0,0, 0, 0);
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
