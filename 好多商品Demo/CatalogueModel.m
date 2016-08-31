//
//  CatalogueModel.m
//  好多商品Demo
//
//  Created by 孙博 on 16/8/26.
//  Copyright © 2016年 Sun. All rights reserved.
// 目录

#import "CatalogueModel.h"
#import "WWNetworkTools.h"

@interface WWNetworkTools ()

// 主分类数组
@property (nonatomic, strong)NSArray *catalogueArr;
// 商品目录
@property (nonatomic, strong)NSArray *detailArr;

@end

@implementation CatalogueModel

+ (instancetype)modelWithDict:(NSDictionary *)dict{
    CatalogueModel *model = [CatalogueModel new];
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

+ (void)leftModelWithDataSuccess:(void (^)(NSArray<CatalogueModel *> *))successLeft failure:(void (^)(NSError *))failure{
    [[WWNetworkTools sharedTools] surpmarketWithSuccess:^(id response) {
        
//        NSLog(@"%@",response);
        
        NSArray *arr = response[@"data"][@"categories"];
        NSMutableArray *mArr = [NSMutableArray array];
        
        for (NSDictionary *dict in arr) {
            CatalogueModel *model = [CatalogueModel modelWithDict:dict];
            [mArr addObject:model];
        }
        
        [mArr enumerateObjectsUsingBlock:^(CatalogueModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            @autoreleasepool {
                NSArray *tempArr = response[@"data"][@"products"][obj.id];
                NSMutableArray *mArr2 = [NSMutableArray array];
                for (NSDictionary *dic in tempArr) {
                    DetailModel *model = [DetailModel rightCellModelWithDict:dic];
                    [mArr2 addObject:model];
                }
                obj.rightArray = mArr2.copy;
            }
        }];
        
        successLeft(mArr.copy);
    } failure:^(NSError *error) {
        failure(error);
    }];
}



@end
