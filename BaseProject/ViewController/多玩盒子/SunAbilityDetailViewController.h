//
//  SunAbilityDetailViewController.h
//  BaseProject
//
//  Created by tarena on 2016/12/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SumAbilityModel.h"
@interface SunAbilityDetailViewController : UIViewController

-(id)initWithSunAbilityModel:(SumAbilityModel *)abilityModel ;
@property(nonatomic,strong)SumAbilityModel *abilityModel;
@end
