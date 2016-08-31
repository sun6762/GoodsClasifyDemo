//
//  DetailModel.h
//  好多商品Demo
//
//  Created by 孙博 on 16/8/29.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailModel : NSObject


/**产品小图url*/
@property (nonatomic,copy) NSString *img;
/**商品名*/
@property (nonatomic,copy) NSString *name;
/**买一赠送*/
@property (nonatomic,copy) NSString *pm_desc;
/**产品规格 g/瓶*/
@property (nonatomic,copy) NSString *specifics;
/**现价*/
@property (nonatomic,copy) NSString *price;
/**原价*/
@property (nonatomic,copy) NSString *market_price;
/**库存*/
@property (nonatomic,assign) NSInteger store_nums;
/**品牌*/
@property (nonatomic,copy) NSString *brand_name;
/**产品类别id标识,获取对应商品的数据*/
@property (nonatomic,assign) NSInteger id;

// 记录用户添加当前商品的数量
@property (nonatomic, assign) NSInteger userBuyCount;

/**字典转模型*/
+ (instancetype)rightCellModelWithDict:(NSDictionary *)dict;
@end
