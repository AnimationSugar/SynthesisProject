//
//  TuWanListController.m
//  BaseProject
//
//  Created by tarena on 2016/11/24.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanListController.h"
#import "TuWanListCell.h"
#import "TuWanViewModel.h"
#import "TuWanImageCell.h"
#import "iCarousel.h"

@interface TuWanListController ()<iCarouselDelegate,iCarouselDataSource>
@property(nonatomic,strong)TuWanViewModel *tuwanVM;
@end

@implementation TuWanListController
//添加成员变量，因为不需要懒加载，所以不需要使用属性
{
    iCarousel *_iC;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    NSTimer *_timer;
}
-(UIView *)headerView{
    //进入之前先关定时器
    [_timer invalidate];
    if (![self.tuwanVM isExistIndexPic])  return nil;
    
    //头部试图的初始点无效，宽度已定
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, kWindowW *500/750)];
    //添加头部视图下方View（Lable+pageControl）
    UIView *bottomView  = [UIView new];
    bottomView.backgroundColor = kRGBColor(240, 240, 240);
    [headerView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    _titleLb = [UILabel new];
    [bottomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = self.tuwanVM.indexPicNumber;
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    [bottomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(-10);
    }];
    _titleLb.text = [self.tuwanVM titleForRowInIndexPic:0];
    //添加滚动栏
    _iC =[iCarousel new];
    [headerView addSubview:_iC];
    [_iC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_equalTo(0);
    }];
    _iC.delegate = self;
    _iC.dataSource = self;
    _iC.pagingEnabled = YES;
    _iC.scrollSpeed = -1;
    //只有一张图，不显示原点
    _pageControl.hidesForSinglePage = YES;
    //小圆点不可与用户交互
    _pageControl.userInteractionEnabled = NO;
    //只有一张图，则不滚动
    _iC.scrollEnabled = self.tuwanVM.indexPicNumber != 1;
    
    //针对定时滚动
    if (self.tuwanVM.indexPicNumber>1) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_iC scrollToItemAtIndex:_iC.currentItemIndex+1 animated:YES];
        } repeats:YES];
    }
    
    return headerView;
}
#pragma mark - iCarouselDelegate
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.tuwanVM.indexPicNumber;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW *500/750-35)];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    [imageView setImageWithURL:[self.tuwanVM iconURLForRowInList:index] placeholderImage:[UIImage imageNamed:@"find_hot_albumcover"]];
    return view;
}
//允许循环滚动
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}
//监控头部视图当前滚动的位置
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _titleLb.text = [self.tuwanVM titleForRowInIndexPic:carousel.currentItemIndex];
    _pageControl.currentPage = carousel.currentItemIndex;
}


-(TuWanViewModel *)tuwanVM{
    if (!_tuwanVM) {
        _tuwanVM = [[TuWanViewModel alloc]initWithType:_infoType.integerValue];
    }
    return _tuwanVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TuWanListCell class] forCellReuseIdentifier:@"ListCell"];
    [self.tableView registerClass:[TuWanImageCell class] forCellReuseIdentifier:@"ImageCell"];
     self.tableView.header  = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
         [self.tuwanVM refreshDataCompletionHandle:^(NSError *error) {
             //更新头部视图
             self.tableView.tableHeaderView = [self headerView];
             
             [self.tableView.header endRefreshing];
             [self.tableView reloadData];
         }];
     }];
    [self.tableView.header beginRefreshing];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.tuwanVM getMoreDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView = [self headerView];
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tuwanVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.tuwanVM containImages:indexPath.row]) {
        TuWanImageCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
        cell.titileLb.text = [self.tuwanVM titleForRowInList:indexPath.row];
        cell.clicksNumLb.text = [self.tuwanVM clicksForRowInList:indexPath.row];
        [cell.iconIV0.imageView setImageWithURL:[self.tuwanVM iconURLSForRowInList:indexPath.row][0] placeholderImage:[UIImage imageNamed:@"find_hot_albumcover"]];
        [cell.iconIV1.imageView setImageWithURL:[self.tuwanVM iconURLSForRowInList:indexPath.row][1] placeholderImage:[UIImage imageNamed:@"find_hot_albumcover"]];
        [cell.iconIV2.imageView setImageWithURL:[self.tuwanVM iconURLSForRowInList:indexPath.row][2] placeholderImage:[UIImage imageNamed:@"find_hot_albumcover"]];
        return cell;
    }
    TuWanListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
    [cell.iconIV.imageView setImageWithURL:[self.tuwanVM iconURLForRowInList:indexPath.row] placeholderImage:[UIImage imageNamed:@"find_hot_albumcover"]];
    cell.titleLable.text = [self.tuwanVM titleForRowInList:indexPath.row];
    cell.longTitleLb.text = [self.tuwanVM descForRowInList:indexPath.row];
    cell.clicksNumLb.text = [self.tuwanVM clicksForRowInList:indexPath.row];
    
    
    return cell;
}

kRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [self.tuwanVM containImages:indexPath.row]?135:90;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
