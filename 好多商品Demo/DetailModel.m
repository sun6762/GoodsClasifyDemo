//
//  DetailModel.m
//  好多商品Demo
//
//  Created by 孙博 on 16/8/29.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "DetailModel.h"

@implementation DetailModel

+ (instancetype)rightCellModelWithDict:(NSDictionary *)dict {
    DetailModel *model = [[DetailModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

#pragma mark
#pragma mark - ***************中文输出和没有使用的key
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}
- (NSString *)description {
    
    return [NSString stringWithFormat:@"name: %@, price: %@" ,self.name,self.price];
}
//- (NSString *)description {
//    
//    return [NSString stringWithFormat:@"img: %@, name: %@, pm_desc: %@, specifics: %@, price: %@, market_price: %@, store_nums: %ld, brand_name: %@, id: %ld, userBuyCount: %ld" ,self.img,self.name,self.pm_desc,self.specifics,self.price,self.market_price,self.store_nums,self.brand_name,self.id,self.userBuyCount];
//}

@end
