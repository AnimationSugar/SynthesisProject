//
//  BestGroupViewController.m
//  BaseProject
//
//  Created by tarena on 2016/12/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BestGroupViewController.h"
#import "BestGroupViewModel.h"
#import "BestGroupCell.h"
#import "BestGroupDetailViewController.h"
@interface BestGroupViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)BestGroupViewModel *bestVM;
@end

@implementation BestGroupViewController
- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[BestGroupCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
           [self.bestVM getDataFromNetCompleteHandle:^(NSError *error) {
               if (error) {
                   [self showErrorMsg:error.localizedDescription];
               }else{
                   [_tableView reloadData];
               }
               [_tableView.header endRefreshing];
           }];
        }];
    }
    return _tableView;
}

- (BestGroupViewModel *)bestVM {
    if(_bestVM == nil) {
        _bestVM = [[BestGroupViewModel alloc] init];
    }
    return _bestVM;
}

#pragma mark -UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.bestVM.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BestGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.bestVM titleForRow:indexPath.row];
    cell.descLb.text = [self.bestVM descForRow:indexPath.row];
    [cell.icon0IV setImageWithURL:[self.bestVM iconsURLForRow:indexPath.row][0] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    [cell.icon1IV setImageWithURL:[self.bestVM iconsURLForRow:indexPath.row][1] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    [cell.icon2IV setImageWithURL:[self.bestVM iconsURLForRow:indexPath.row][2] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    [cell.icon3IV setImageWithURL:[self.bestVM iconsURLForRow:indexPath.row][3] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    [cell.icon4IV setImageWithURL:[self.bestVM iconsURLForRow:indexPath.row][4] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    return cell;
}
kRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BestGroupDetailViewController *vc = [[BestGroupDetailViewController alloc]initWithTitle:[self.bestVM titleForRow:indexPath.row] desc:[self.bestVM descForRow:indexPath.row] icons:[self.bestVM iconsURLForRow:indexPath.row] descs:[self.bestVM descsForRow:indexPath.row]];
    
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"最强阵容";
    [Factory addBackItemToVC:self];
    [self.tableView.header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
