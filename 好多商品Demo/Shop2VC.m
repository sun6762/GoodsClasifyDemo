//
//  Shop2VC.m
//  好多商品Demo
//
//  Created by 孙博 on 16/8/29.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "Shop2VC.h"
#import "ScrollBanner.h"
#import "CatalogueModel.h"
#import "GoodsCell.h"
#import "SVProgressHUD.h"

#define Margin 8

@interface Shop2VC ()<UICollectionViewDataSource,UIBarPositioningDelegate>

// 横条
@property (nonatomic, weak)ScrollBanner *banner;

// collectionview
@property (nonatomic, weak)UICollectionView *collectionview;

// coll 用到的源数据
@property (nonatomic, strong)NSArray *dataArray;

// comper
@property (nonatomic, strong)NSArray *comArr;

// 初始数据
@property (nonatomic, strong)NSArray *originalArray;

// 升序数据
@property (nonatomic, strong)NSArray *increaseArr;

// 降序数据
@property (nonatomic, strong)NSArray *decreaseArr;

@end

@implementation Shop2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取数据
    [self dealupData];
//     设置UI
    [self setupUI];
}

#pragma
#pragma mark - 处理数据 -
- (void)dealupData{
    [CatalogueModel leftModelWithDataSuccess:^(NSArray<CatalogueModel *> *array) {
        self.originalArray = array;
    } failure:^(NSError *error) {
        NSLog(@"shop2获取数据失败");
    }];
}

- (void)setOriginalArray:(NSArray *)originalArray{
    _originalArray = originalArray;
    
    // 基础处理
    NSMutableArray *mArr = [NSMutableArray array];
    [originalArray enumerateObjectsUsingBlock:^(CatalogueModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx < 3){
            for (DetailModel *model in obj.rightArray) {
                [mArr addObject:model];
            }
        }
    }];
    self.comArr = mArr.copy;
    self.dataArray = self.comArr;
    [self.collectionview reloadData];
    [SVProgressHUD dismiss];
    // 获取升序数据
    for (int i = 0; i < mArr.count - 1; i++) {
        for (int j = 0; j < mArr.count - i - 1; j++) {
            DetailModel *model1 = mArr[j];
            DetailModel *model2 = mArr[j+1];
            if ([model1.price floatValue] > [model2.price floatValue
                ]) {
                DetailModel *temp = mArr[j];
                mArr[j] = mArr[j+1];
                mArr[j+1] = temp;
            }
            
        }
    }
    self.increaseArr = mArr.copy;
}

#pragma
#pragma mark - 处理点击 - 
- (void)dealClick{
    
    self.banner.clickBlock = ^(BtnType type,BOOL state){
      
        switch (type) {
            case BtnTypeComprehensive:
                self.dataArray = self.comArr;
                break;
            case BtnTypeSale:
                self.dataArray = self.comArr;
                break;
            case BtnTypePrice:
                self.dataArray = self.increaseArr;
                break;
            default:
                break;
        }
        [self.collectionview reloadData];
    };
//    NSLog(@"%@",self.dataArray);
}

#pragma
#pragma mark - 设置UI - 
- (void)setupUI{
    self.view.backgroundColor = [UIColor colorWithRed:218/256.0 green:218/256.0 blue:218/256.0 alpha:1];
    
    // HUD
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showWithStatus:@"拼命加载中..."];
    
    ScrollBanner *banner = [[ScrollBanner alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navigationController.navigationBar.frame) + 8, self.view.frame.size.width, 30)];
    [self.view addSubview:banner];
    self.banner = banner;
    [self dealClick];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    flow.minimumInteritemSpacing = Margin;
    flow.minimumLineSpacing = Margin;
    CGFloat itemWidth = ([UIScreen mainScreen].bounds.size.width - (CGFloat)Margin) * 0.5;
    flow.itemSize = CGSizeMake(itemWidth, itemWidth * 1.4);
    flow.scrollDirection = UICollectionViewScrollDirectionVertical;
    UICollectionView *collView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(banner.frame) + 10, self.view.frame.size.width, [UIScreen mainScreen].bounds.size.height - 10 - CGRectGetMaxY(banner.frame)) collectionViewLayout:flow];
    
    collView.backgroundColor = [UIColor colorWithRed:218/256.0 green:218/256.0 blue:218/256.0 alpha:1];
    collView.delegate = self;
    collView.dataSource = self;
    [collView registerClass:[GoodsCell class] forCellWithReuseIdentifier:@"sun"];
    [self.view addSubview:collView];
    self.collectionview = collView;
}

#pragma
#pragma mark - datasource -
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"%ld",self.dataArray.count);
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GoodsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"sun" forIndexPath:indexPath];
    
    cell.model = self.dataArray[indexPath.item];
//    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

#pragma
#pragma mark - delegate -


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
