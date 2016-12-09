//
//  BestGroupDetailIntroCell.m
//  BaseProject
//
//  Created by tarena on 2016/12/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BestGroupDetailIntroCell.h"
#define SPACE (kWindowW-250)/6

@implementation BestGroupDetailIntroCell



- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        _titleLb.font= [UIFont systemFontOfSize:17];
        _titleLb.numberOfLines = 1;
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(10);
        }];
    }
    return _titleLb;
}
- (UILabel *)descLb {
    if(_descLb == nil) {
        _descLb = [[UILabel alloc] init];
        [self.contentView addSubview:_descLb];
        _descLb.font = [UIFont systemFontOfSize:14];
        _descLb.numberOfLines = 0;
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _descLb;
}

- (UIImageView *)icon0IV {
    if(_icon0IV == nil) {
        _icon0IV = [[UIImageView alloc] init];
        [self.contentView addSubview:_icon0IV];
        [_icon0IV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.left.mas_equalTo(SPACE);
            make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(8);
            make.bottom.mas_equalTo(_descLb.mas_top).mas_equalTo(-8);
        }];
        
    }
    return _icon0IV;
}

- (UIImageView *)icon1IV {
    if(_icon1IV == nil) {
        _icon1IV = [[UIImageView alloc] init];
        [self.contentView addSubview:_icon1IV];
        [_icon1IV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_icon0IV.mas_right).mas_equalTo(SPACE);
            make.centerY.mas_equalTo(_icon0IV.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
    }
    return _icon1IV;
}

- (UIImageView *)icon2IV {
    if(_icon2IV == nil) {
        _icon2IV = [[UIImageView alloc] init];
        [self.contentView addSubview:_icon2IV];
        [_icon2IV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_icon1IV.mas_right).mas_equalTo(SPACE);
            make.centerY.mas_equalTo(_icon0IV.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
    }
    return _icon2IV;
}

- (UIImageView *)icon3IV {
    if(_icon3IV == nil) {
        _icon3IV = [[UIImageView alloc] init];
        [self.contentView addSubview:_icon3IV];
        [_icon3IV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_icon2IV.mas_right).mas_equalTo(SPACE);
            make.centerY.mas_equalTo(_icon0IV.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
    }
    return _icon3IV;
}

- (UIImageView *)icon4IV {
    if(_icon4IV == nil) {
        _icon4IV = [[UIImageView alloc] init];
        [self.contentView addSubview:_icon4IV];
        [_icon4IV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_icon3IV.mas_right).mas_equalTo(SPACE);
            make.centerY.mas_equalTo(_icon0IV.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
    }
    return _icon4IV;
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

@end
