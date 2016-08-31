//
//  WWNetworkTools.m
 
//
//  Created by 张湾湾 on 16/7/24.
//  Copyright © 2016年 张湾湾. All rights reserved.
//

#import "WWNetworkTools.h"
typedef NS_ENUM(NSUInteger, NetworkToolsType) {
    NetworkToolsTypeGet,
    NetworkToolsTypePost,
   
};
@implementation WWNetworkTools

//全局变量
    static WWNetworkTools * instance;
//创建单例模型
+ (instancetype)sharedTools{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        //1.实例化
        instance = [[WWNetworkTools alloc] initWithSessionConfiguration:configuration];
        
        //2.可接受格式
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
        
        //3.请求格式（默认：二进制）
        instance.requestSerializer = [AFJSONRequestSerializer serializer];
        
        //4.超时
        instance.requestSerializer.timeoutInterval = 10.0;
    });
    
    return instance;
    
 }

#pragma mark - 封装调用
- (void)loadData:(NetworkToolsType)type parmeters:(id)parmeters urlString:(NSString*)urlString success:(void(^)(id response))success failure:(void(^)(NSError*error))failure{
    if (type == NetworkToolsTypeGet) {
        [[WWNetworkTools sharedTools]GET:urlString parameters:parmeters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
//            NSLog(@"%@",responseObject);
            success(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
//            NSLog(@"%@",error);
        }];
    }else if(type == NetworkToolsTypePost){
        [[WWNetworkTools sharedTools]POST:urlString parameters:parmeters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
//            NSLog(@"post %@",responseObject);
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
//            NSLog(@"post%@",error);
        }];
        
    }
}

#pragma mark - 回调数据 -
/**首页*/
- (void)getHomeWithSuccess:(void(^)(id response))success failure:(void(^)(NSError*error))failure{
    NSString * url = @"http://iosapi.itcast.cn/loveBeen/focus.json.php";
    NSDictionary * paramDic = @{@"call":@1};
    [[WWNetworkTools sharedTools]loadData:NetworkToolsTypePost parmeters:paramDic urlString:url success:success failure:failure];
     
   }

/**新鲜热卖*/
- (void)fruitSellWithSuccess:(void(^)(id response))success failure:(void(^)(NSError*error))failure{
    NSString * url = @"http://iosapi.itcast.cn/loveBeen/firstSell.json.php";
    NSDictionary * paramDic = @{@"call":@2};
    [[WWNetworkTools sharedTools]loadData:NetworkToolsTypePost parmeters:paramDic urlString:url success:success failure:failure];
}

/**程序启动广告*/
- (void)advertWithSuccess:(void(^)(NSString*response))success failure:(void(^)(NSError*error))failure{
    NSString * url = @"http://iosapi.itcast.cn/loveBeen/ad.json.php";
    NSDictionary * paramDic = @{@"call":@7};
    [[WWNetworkTools sharedTools]loadData:NetworkToolsTypePost parmeters:paramDic urlString:url success:success failure:failure];
    
}
/**闪电超市*/
- (void)surpmarketWithSuccess:(void(^)(id response))success failure:(void(^)(NSError*error))failure{
    NSString * url = @"http://iosapi.itcast.cn/loveBeen/supermarket.json.php";
    NSDictionary * paramDic = @{@"call":@5};
    [[WWNetworkTools sharedTools]loadData:NetworkToolsTypePost parmeters:paramDic urlString:url success:success failure:failure];
    
}

/**搜索关键词*/
- (void)searchWithSuccess:(void(^)(NSString*response))success failure:(void(^)(NSError*error))failure{
    NSString * url = @"http://iosapi.itcast.cn/loveBeen/search.json.php";
    NSDictionary * paramDic = @{@"call":@6};
    [[WWNetworkTools sharedTools]loadData:NetworkToolsTypePost parmeters:paramDic urlString:url success:success failure:failure];
    
}

/**搜索返回的结果*/
- (void)searchResultWithSuccess:(void(^)(NSString*response))success failure:(void(^)(NSError*error))failure{
    NSString * url = @"http://iosapi.itcast.cn/loveBeen/promotion.json.php";
    NSDictionary * paramDic = @{@"call":@8};
    [[WWNetworkTools sharedTools]loadData:NetworkToolsTypePost parmeters:paramDic urlString:url success:success failure:failure];
    
}
/**我的*/
- (void)meWithSuccess:(void(^)(NSString*response))success failure:(void(^)(NSError*error))failure{
    NSString * url = @"http://iosapi.itcast.cn/loveBeen/MyOrders.json.php";
    NSDictionary * paramDic = @{@"call":@13};
    [[WWNetworkTools sharedTools]loadData:NetworkToolsTypePost parmeters:paramDic urlString:url success:success failure:failure];
}

/**优惠券*/
- (void)myCouponWithSuccess:(void(^)(NSString*response))success failure:(void(^)(NSError*error))failure{
    NSString * url = @"http://iosapi.itcast.cn/loveBeen/MyCoupon.json.php";
    NSDictionary * paramDic = @{@"call":@9};
    [[WWNetworkTools sharedTools]loadData:NetworkToolsTypePost parmeters:paramDic urlString:url success:success failure:failure];
    
}

/**系统消息*/
- (void)systemMessageWithSuccess:(void(^)(NSString*response))success failure:(void(^)(NSError*error))failure{
    NSString * url = @"http://iosapi.itcast.cn/loveBeen/SystemMessage.json.php";
    NSDictionary * paramDic = @{@"call":@10};
    [[WWNetworkTools sharedTools]loadData:NetworkToolsTypePost parmeters:paramDic urlString:url success:success failure:failure];
}
/**我的信息*/
- (void)userMessageWithSuccess:(void(^)(NSString*response))success failure:(void(^)(NSError*error))failure{
    NSString * url = @"http://iosapi.itcast.cn/loveBeen/UserMessage.json.php";
    NSDictionary * paramDic = @{@"call":@11};
    [[WWNetworkTools sharedTools]loadData:NetworkToolsTypePost parmeters:paramDic urlString:url success:success failure:failure];
}


/**收货地址*/
- (void)mayAdressWithSuccess:(void(^)(NSString*response))success failure:(void(^)(NSError*error))failure{
    NSString * url = @"http://iosapi.itcast.cn/loveBeen/MyAdress.json.php";
    NSDictionary * paramDic = @{@"call":@12};
    [[WWNetworkTools sharedTools]loadData:NetworkToolsTypePost parmeters:paramDic urlString:url success:success failure:failure];
}


@end
