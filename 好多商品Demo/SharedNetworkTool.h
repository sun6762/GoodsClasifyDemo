//
//  SharedNetworkTool.h
//  好多商品Demo
//
//  Created by 孙博 on 16/8/24.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZWSingleton.h"
#import "AFNetworking.h"

@interface SharedNetworkTool : AFHTTPSessionManager

INTERFACE_SINGLETON(SharedNetworkTool)

- (void)getDataWithSuccess:(void(^)(id response))success failure:(void(^)(NSError *error))failure;

@end
