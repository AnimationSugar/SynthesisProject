//
//  TuWanViewModel.h
//  BaseProject
//
//  Created by tarena on 2016/11/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"
@interface TuWanViewModel : BaseViewModel
/**必须使用此初始化方法，需要一个类型*/
-(instancetype)initWithType:(InfoType)type;
@property(nonatomic) InfoType type;
//当前页数的索引值
@property(nonatomic)NSInteger start;

//当前行数
@property(nonatomic)NSInteger rowNumber;

//判断某一行Cell类型
-(BOOL)containImages:(NSInteger)row;


//返回列表中某行数据题目
-(NSString *)titleForRowInList:(NSInteger)row;
//返回列表中某行数据图片
-(NSURL *)iconURLForRowInList:(NSInteger)row;
//返回列表中某行数据描述
-(NSString *)descForRowInList:(NSInteger)row;
//返回列表中某行数据浏览人数
-(NSString *)clicksForRowInList:(NSInteger)row;

//滚动展示栏的图片
-(NSURL *)iconURLForRowInIndexPic:(NSInteger)row;
//滚动展示栏的文字
-(NSString *)titleForRowInIndexPic:(NSInteger)row;
//滚动展示栏的图片数量
@property(nonatomic)NSInteger indexPicNumber;
//获取列表中某行数据对应的html5链接
-(NSURL *)detailURLForRowInList:(NSInteger)row;
//获取展示栏中某行数据对应的html5链接
-(NSURL *)detailURLForRowInIndexPic:(NSInteger)row;


//用于存放头部滚动栏
@property(nonatomic,strong)NSArray *indexPicArr;
//是否有头部滚动栏
@property(nonatomic,getter=isExistIndexPic) BOOL existIndexPic;

/**通过行数返回此行中对应的图片链接数组*/
-(NSArray *)iconURLSForRowInList:(NSInteger)row;

//判断详细内容的显示种类
/** 判断数据类型是视频  video*/
-(BOOL)isVideoInListForRow:(NSInteger)row;
-(BOOL)isVideoInIndexPicForRow:(NSInteger)row;
/** 判断数据类型是图片  pic*/
-(BOOL)isPicInListForRow:(NSInteger)row;
-(BOOL)isPicInIndexPicForRow:(NSInteger)row;
/** 判断数据类型是Html  all*/
-(BOOL)isHtmlInListForRow:(NSInteger)row;
-(BOOL)isHtmlInIndexPicForRow:(NSInteger)row;
@end
















