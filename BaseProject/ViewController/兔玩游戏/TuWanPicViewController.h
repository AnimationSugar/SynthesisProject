//
//  TuWanPicViewController.h
//  BaseProject
//
//  Created by tarena on 2016/11/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanPicViewController : UIViewController
{
    @private//私有
    NSString *private1;
    @protected//保护——默认保护的
    NSString *protected1;
    @public //共有
    NSString *public1;
}
/**此界面内容要根据aid来决定，随意aid是必须的*/
-(id _Nonnull)initWithAid:(NSString *_Nonnull)aid;
@property(nonatomic,strong)NSString *_Nonnull aid;
@end
