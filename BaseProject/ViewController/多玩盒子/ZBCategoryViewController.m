//
//  ZBCategoryViewController.m
//  BaseProject
//
//  Created by tarena on 2016/12/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZBCategoryViewController.h"
#import "ZBCategoryViewModel.h"
#import "ZBItemViewController.h"

@interface ZBCategoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)ZBCategoryViewModel *zbVM;
@end

@implementation ZBCategoryViewController
- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
           [self.zbVM getDataFromNetCompleteHandle:^(NSError *error) {
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

- (ZBCategoryViewModel *)zbVM {
    if(_zbVM == nil) {
        _zbVM = [[ZBCategoryViewModel alloc] init];
    }
    return _zbVM;
}
-(id)init{
    if (self = [super init]) {
        [Factory addBackItemToVC:self];
        self.title = @"装备分类";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView.header beginRefreshing];
}
#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.zbVM.rowNumber;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" ];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [self.zbVM textForRow:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZBItemViewController *vc = [[ZBItemViewController alloc]initWithTag:[self.zbVM tagForRow:indexPath.row] name:[self.zbVM textForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
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
