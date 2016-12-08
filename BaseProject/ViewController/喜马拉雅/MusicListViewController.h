//
//  MusicListViewController.h
//  BaseProject
//
//  Created by tarena on 2016/12/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicListViewController : UIViewController

-(instancetype)initWithAlbumId:(NSInteger)albumId;

@property(nonatomic)NSInteger albumId;
@end
