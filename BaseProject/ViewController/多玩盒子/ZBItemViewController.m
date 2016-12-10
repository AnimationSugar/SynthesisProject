//
//  ZBItemViewController.m
//  BaseProject
//
//  Created by tarena on 2016/12/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZBItemViewController.h"
#import "ZBItemViewModel.h"
#import "ZBDetailViewControlle.h"
@implementation ZBItemCell
-(UILabel *)nameLb{
    if (!_nameLb) {
        _nameLb = [[UILabel alloc]init];
        _nameLb.font = [UIFont systemFontOfSize:11];
        _nameLb.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
        }];
    }
    return _nameLb;
}

-(TRImageView *)iconView{
    if (!_iconView) {
        _iconView = [[TRImageView alloc]init];
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(_iconView.mas_width);
        }];
    }
    return _iconView;
}
@end
@interface ZBItemViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)ZBItemViewModel *itemVM;

@end

@implementation ZBItemViewController
-(id)initWithTag:(NSString *)tag name:(NSString *)name{
    if (self = [super init]) {
        self.tag = tag;
        self.title = name;
        [Factory addBackItemToVC:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView.header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(ZBItemViewModel *)itemVM{
    if (!_itemVM) {
        _itemVM = [[ZBItemViewModel alloc]initWithTag:self.tag];
    }
    return _itemVM;
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        [self.view addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.itemVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_collectionView reloadData];
                }
                [_collectionView.header endRefreshing];
            }];
        }];
        [_collectionView registerClass:[ZBItemCell class] forCellWithReuseIdentifier:@"Cell"];
    }
    return _collectionView;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.itemVM.rowNumber;
}
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return self.itemVM.rowNumber;
//}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZBItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconView.imageView setImageWithURL:[self.itemVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.nameLb.text = [self.itemVM itemNameForRow:indexPath.row];
    return cell;
}

#pragma mark - UIColleciewtionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ZBDetailViewControlle *vc = [[ZBDetailViewControlle alloc]initWithEquipId:[self.itemVM itemIdForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - UICollectionViewDelegateFlowLayout
/**每个Cell的大小*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kWindowW-100)/4;
    CGFloat height = width + 17;
    return CGSizeMake(width, height);
}
/**section的上下左右边距*/
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 20, 5, 20);
}
/**最小行间距*/
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
    
}
/**最小列边距  由于cell的宽度已定  会自定适配
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 20;
}*/
@end

























