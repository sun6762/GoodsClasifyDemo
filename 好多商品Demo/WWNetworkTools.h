//
//  WWNetworkTools.h

//
//  Created by 张湾湾 on 16/7/24.
//  Copyright © 2016年 张湾湾. All rights reserved.
//

#import "AFNetworking.h"
#import "CatalogueModel.h"

@interface WWNetworkTools : AFHTTPSessionManager

+ (instancetype)sharedTools;

/**首页*/
- (void)getHomeWithSuccess:(void(^)(id response))success failure:(void(^)(NSError*error))failure;
/**新鲜热卖*/
- (void)fruitSellWithSuccess:(void(^)(id response))success failure:(void(^)(NSError*error))failure;
/**程序启动广告*/
- (void)advertWithSuccess:(void(^)(NSString*response))success failure:(void(^)(NSError*error))failure;
/**闪电超市*/
- (void)surpmarketWithSuccess:(void(^)(id response))success failure:(void(^)(NSError*error))failure;
/**搜索关键词*/
- (void)searchWithSuccess:(void(^)(NSString*response))success failure:(void(^)(NSError*error))failure;
/**搜索返回的结果*/
- (void)searchResultWithSuccess:(void(^)(NSString*response))success failure:(void(^)(NSError*error))failure;
/**我的*/
- (void)meWithSuccess:(void(^)(NSString*response))success failure:(void(^)(NSError*error))failure;
/**优惠券*/
- (void)myCouponWithSuccess:(void(^)(NSString*response))success failure:(void(^)(NSError*error))failure;
/**系统消息*/
- (void)systemMessageWithSuccess:(void(^)(NSString*response))success failure:(void(^)(NSError*error))failure;
/**我的信息*/
- (void)userMessageWithSuccess:(void(^)(NSString*response))success failure:(void(^)(NSError*error))failure;
/**收货地址*/
- (void)mayAdressWithSuccess:(void(^)(NSString*response))success failure:(void(^)(NSError*error))failure;









@end
