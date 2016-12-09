//
//  BestGroupDetailViewController.m
//  BaseProject
//
//  Created by tarena on 2016/12/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BestGroupDetailViewController.h"
#import "BestGroupDetailHeroCell.h"
#import "BestGroupDetailIntroCell.h"
@interface BestGroupDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;


@end

@implementation BestGroupDetailViewController
-(id)initWithTitle:(NSString *)title desc:(NSString *)desc icons:(NSArray *)icons descs:(NSArray *)descs{
    if (self = [super init]) {
        self.title0 = title;
        self.desc = desc;
        self.icons = icons;
        self.descs = descs;
    }
    return self;
}
- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        _tableView.tableFooterView= [UIView new];
        //去掉头部和脚部section的显示范围
        _tableView.contentInset = UIEdgeInsetsMake(-1, 0, -10, 0);
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[BestGroupDetailIntroCell class] forCellReuseIdentifier:@"Cell1"];
        [_tableView registerClass:[BestGroupDetailHeroCell class] forCellReuseIdentifier:@"Cell2"];
    }
    return _tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    self.title = @"阵容详情";
    [self.tableView reloadData];
}
#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return self.descs.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        BestGroupDetailIntroCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"Cell1"];
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        cell1.titleLb.text = _title0;
        cell1.descLb.text =[@"        "  stringByAppendingString: _desc];
        //cell1.icon0IV.image  = [UIImage imageNamed:@"cell_bg_noData_1"];
        [cell1.icon0IV setImageWithURL:_icons[0] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell1.icon1IV setImageWithURL:_icons[1] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell1.icon2IV setImageWithURL:_icons[2] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell1.icon3IV setImageWithURL:_icons[3] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell1.icon4IV setImageWithURL:_icons[4] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        return cell1;
    }else{
        BestGroupDetailHeroCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"Cell2"];
        cell2.descLb.text = _descs[indexPath.row];
        [cell2.headIV setImageWithURL:_icons[indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        return cell2;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 0) {
//        [_tableView deselectRowAtIndexPath:indexPath animated:YES];
//    }
    
}
kRemoveCellSeparator
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
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
