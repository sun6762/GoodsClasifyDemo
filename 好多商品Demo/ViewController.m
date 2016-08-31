//
//  ViewController.m
//  好多商品Demo
//
//  Created by 孙博 on 16/8/24.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "ViewController.h"
#import "WWNetworkTools.h"
#import "CatalogueModel.h"
#import "Shop1VC.h"
#import "Shop2VC.h"
#import <YYModel.h>

@interface ViewController ()

@property (nonatomic, strong)NSArray<CatalogueModel *> *catalogueArr;

@property (nonatomic, strong)NSArray *detailArr;


@property (nonatomic, strong)NSArray *arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)shop1:(id)sender {
    
    Shop1VC *shop1 = [[Shop1VC alloc]init];
    
    [self.navigationController pushViewController:shop1 animated:YES];
    
}
- (IBAction)shop2:(id)sender {
    Shop2VC *shop2 = [[Shop2VC alloc]init];
    
    [self.navigationController pushViewController:shop2 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
