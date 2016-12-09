//
//  BaiKeViewController.m
//  BaseProject
//
//  Created by tarena on 2016/12/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaiKeViewController.h"
#import "ToolMenuViewModel.h"
#import "TRImageView.h"
#import "TuWanHtmlViewController.h"
#import "BestGroupViewController.h"

/**创建自定义Cell：图+题目*/
@interface BaikeCell : UITableViewCell
@property(nonatomic,strong)UIImageView *headIV;
@property(nonatomic,strong)UILabel *titleLb;
@end
@implementation BaikeCell
- (UIImageView *)headIV {
    if(_headIV == nil) {
        _headIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_headIV];
        [_headIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(40, 40));
            make.left.mas_equalTo(5);
        }];
        _headIV.layer.cornerRadius = 3;
    }
    return _headIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        _titleLb.font  = [UIFont systemFontOfSize:16];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_headIV.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(5);
            make.centerY.mas_equalTo(_headIV.mas_centerY);
        }];
    }
    return _titleLb;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}


@end


/**引入Table的协议*/
@interface BaiKeViewController ()<UITableViewDelegate,UITableViewDataSource>
/**viewModel*/
@property(nonatomic,strong)ToolMenuViewModel *toolVM;
/**table*/
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation BaiKeViewController
/**实现tabeView懒加载
 1）设置代理
 2）脚部和头部视图
 3）多余cell
 4）这册Cell*/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.rowHeight = 50;
        [_tableView registerClass:[BaikeCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.tableFooterView = [UIView new];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.toolVM getDataFromNetCompleteHandle:^(NSError *error) {
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

/**实现ViewModel懒加载
*/
-(ToolMenuViewModel *)toolVM{
    if (!_toolVM) {
        _toolVM = [[ToolMenuViewModel alloc]init];
        
    }
    return _toolVM;
}

/**tableView的协议方法：去分割线，去持续选中效果*/

-(id)init{
    if (self = [super init]) {
        self.title = @"游戏百科";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    [self.tableView.header beginRefreshing];
    
}
#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.toolVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaikeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.headIV setImageWithURL:[self.toolVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.titleLb.text = [self.toolVM titleForRow:indexPath.row];
    
    return cell;
}
kRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.toolVM itemTypeForRow:indexPath.row] == ToolMenuItemTypeWeb) {
        TuWanHtmlViewController *vc = [[TuWanHtmlViewController alloc]initWithURL:[self.toolVM webURLForRow:indexPath.row]];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([[self.toolVM tagForRow:indexPath.row] isEqualToString:@"best_group"]){
        BestGroupViewController *vc = [BestGroupViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
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
