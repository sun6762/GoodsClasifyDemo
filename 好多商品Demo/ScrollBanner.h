//
//  ScrollBanner.h
//  好多商品Demo
//
//  Created by 孙博 on 16/8/29.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BtnType) {
    BtnTypeComprehensive = 0,
    BtnTypeSale   = 1,
    BtnTypePrice  = 2,
};

@interface ScrollBanner : UIView

@property (nonatomic, copy)void(^clickBlock)(BtnType type,BOOL state);


@end
