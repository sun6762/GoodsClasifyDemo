//
//  SharedNetworkTool.m
//  好多商品Demo
//
//  Created by 孙博 on 16/8/24.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "SharedNetworkTool.h"

@implementation SharedNetworkTool
// 单例
IMPLEMENTATION_SINGLETON(SharedNetworkTool)

- (void)getDataWithSuccess:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    //1.实例化
//    instance = [[WWNetworkTools alloc] initWithSessionConfiguration:configuration];
//    
//    //2.可接受格式
//    instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
//    
//    //3.请求格式（默认：二进制）
//    instance.requestSerializer = [AFJSONRequestSerializer serializer];
//    
//    //4.超时
//    instance.requestSerializer.timeoutInterval = 10.0;
    
    NSString * url = @"http://iosapi.itcast.cn/loveBeen/supermarket.json.php";
    NSDictionary * paramDic = @{@"call":@5};
    
    [SharedNetworkTool sharedInstance].responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    [[SharedNetworkTool sharedInstance]POST:url parameters:paramDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

@end
