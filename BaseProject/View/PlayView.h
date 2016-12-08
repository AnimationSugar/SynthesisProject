//
//  PlayView.h
//  BaseProject
//
//  Created by tarena on 2016/12/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface PlayView : UIView
+(PlayView *)sharedInstance;
-(void)playWithURL:(NSURL *)musicURL;

@property(nonatomic,strong)AVPlayer *player;
@property(nonatomic,strong)UIButton *playBtn;

@end
