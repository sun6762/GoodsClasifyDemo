//
//  Shop1VC.m
//  好多商品Demo
//
//  Created by 孙博 on 16/8/26.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "Shop1VC.h"
#import "CatalogueModel.h"
#import "LeftCell.h"
#import "RightCell.h"
#import "SVProgressHUD.h"

#define SWidth self.view.frame.size.width
#define SHeight self.view.frame.size.height

#define PATH [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"goods.data"]

#define LeftTableReuseID @"LeftTableReuseID"
#define RightTableReuseID @"RightTableReuseID"

@interface Shop1VC ()<UITableViewDataSource,UITableViewDelegate>
// 产品列表
@property (nonatomic, strong)NSArray *catalogueArr;
// 左部的table
@property (nonatomic, weak)UITableView *leftTable;
// 右边的table
@property (nonatomic, weak)UITableView *rightTable;

@end

@implementation Shop1VC

- (void)setCatalogueArr:(NSArray *)catalogueArr{
    _catalogueArr = catalogueArr;
    
    [self.leftTable reloadData];
    [self.rightTable reloadData];
    // 写入到缓存文件
    [self.catalogueArr writeToFile:PATH atomically:YES];
    
    [SVProgressHUD dismiss];
}

- (void)viewDidLoad{
    [super viewDidLoad];
//    NSLog(@"Path:%@",PATH);
    [self setupUI];
    // 先从本地读取
//    self.catalogueArr = [NSArray arrayWithContentsOfFile:PATH];
    
    if (self.catalogueArr == nil) {
        // 获取数据
        [CatalogueModel leftModelWithDataSuccess:^(NSArray<CatalogueModel *> *array) {
            
            self.catalogueArr = array;
        } failure:^(NSError *error) {
            NSLog(@"%@",error);
        }];
    }
}

- (void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;

    // 左 table
    UITableView *leftTable = [[UITableView alloc]init];
    self.leftTable = leftTable;
    leftTable.frame = CGRectMake(0, CGRectGetMaxY(self.navigationController.navigationBar.frame), SWidth * 0.2, SHeight);
    
    leftTable.delegate = self;
    leftTable.dataSource = self;
    leftTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:leftTable];
    
    // 右table
    UITableView *rightTable = [[UITableView alloc]init];
    [self.view addSubview:rightTable];
    rightTable.frame = CGRectMake(SWidth * 0.2, CGRectGetMaxY(self.navigationController.navigationBar.frame), SWidth * 0.8, SHeight);
    
    rightTable.delegate = self;
    rightTable.dataSource = self;
    rightTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.rightTable = rightTable;
    
    // HUD
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showWithStatus:@"拼命加载中..."];
}

#pragma
#pragma mark - datasource - 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([tableView isEqual:self.leftTable]) {
        return 1;
    }else{
        return self.catalogueArr.count;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual:self.leftTable]) {
        return self.catalogueArr.count;
    }else{
        CatalogueModel *catalogueModel = self.catalogueArr[section];
        return catalogueModel.rightArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:self.leftTable]) {
        LeftCell *cell = [[LeftCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:LeftTableReuseID];
        cell.model = self.catalogueArr[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else {
        RightCell *cell = [[RightCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:RightTableReuseID];
        
        CatalogueModel *catalogueModel = self.catalogueArr[indexPath.section];
        cell.model = catalogueModel.rightArray[indexPath.row];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
}

#pragma
#pragma mark - scroll 代理 - 
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    if (scrollView == self.leftTable) return;
    
    //------ 获取右列表可见行
    NSIndexPath *rightTableTopHeaderViewIndexpath = [[self.rightTable indexPathsForVisibleRows] firstObject];
    
    //    NSLog(@"right = %@",rightTableTopHeaderViewIndexpath);
    
    //------ 左列表联动
    NSIndexPath *leftTableSelectIndexpath = [NSIndexPath indexPathForRow:rightTableTopHeaderViewIndexpath.section inSection:0];
    [self.leftTable selectRowAtIndexPath:leftTableSelectIndexpath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    
}

#pragma
#pragma mark - delegate - 
// 选中某一个cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:self.leftTable]) {
        NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
        /**
         UITableViewScrollPositionNone,
         UITableViewScrollPositionTop,
         UITableViewScrollPositionMiddle,
         UITableViewScrollPositionBottom
         */
        [self.rightTable scrollToRowAtIndexPath:index atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }else{
        // 代理
    }
}

// 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:self.rightTable]) {
        return 80;
    }else{
        return 50;
    }
}

// 创建组头view
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if ([tableView isEqual:self.rightTable]) {
//        UIView *view = [[UIView alloc]init];
//        view.backgroundColor = [UIColor orangeColor];
        UILabel *label = [[UILabel alloc]init];
        CatalogueModel *model = self.catalogueArr[section];
        label.text = [NSString stringWithFormat:@"   %@",model.name];
        label.backgroundColor = [UIColor orangeColor];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:16];
        return label;
    }else{
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if ([tableView isEqual:self.rightTable]) {
        return 25;
    }else{
        return 0;
    }
}

// 组名
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    if ([tableView isEqual:self.rightTable]) {
//        CatalogueModel *model = self.catalogueArr[section];
//        return model.name;
//    }else{
//        return nil;
//    }
//}

@end
