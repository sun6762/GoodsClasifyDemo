//
//  CatalogueModel.h
//  好多商品Demo
//
//  Created by 孙博 on 16/8/26.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>
#import "DetailModel.h"
@interface CatalogueModel : NSObject

/**
 *  visibility : 1,
	sort : 1,
	pcid : 55,
	id : a106,
	disabled_show : 0,
	name : 优选水果,
	icon : /upload/activity/2015071416553788.png
 */
@property (nonatomic, copy)NSNumber *sort;

@property (nonatomic, copy)NSString *id;

@property (nonatomic, copy)NSString *name;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

/**商品列表*/
@property (nonatomic,strong) NSArray<DetailModel *> *rightArray;


+ (void)leftModelWithDataSuccess:(void(^)(NSArray<CatalogueModel   *> *array))successLeft  failure:(void(^)(NSError *error))failure;

@end
