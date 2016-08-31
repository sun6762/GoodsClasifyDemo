//
//  ScrollBanner.m
//  好多商品Demo
//
//  Created by 孙博 on 16/8/29.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "ScrollBanner.h"
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface ScrollBanner ()

@property (nonatomic, weak)UIButton *comprehensiveBtn;

@property (nonatomic, weak)UIButton *saleBtn;

@property (nonatomic, weak)UIButton *priceBtn;

@property (nonatomic, weak)UIView *yellowView;

@end

@implementation ScrollBanner

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)clickComprehensiveBtn:(UIButton *)btn{
    if (self.clickBlock) {
        self.clickBlock(BtnTypeComprehensive,nil);
    }
}

- (void)clickSaleBtn:(UIButton *)btn{
    if (self.clickBlock) {
        self.clickBlock(BtnTypeSale,nil);
    }
}

- (void)clickPrcieBtn:(UIButton *)btn{
    if (self.clickBlock) {
        self.clickBlock(BtnTypePrice,nil);
    }
}

- (void)setupUI{
    self.backgroundColor = [UIColor whiteColor];
    
    UIButton *comprehensiveBtn = [[UIButton alloc]init];
    [self addSubview:comprehensiveBtn];
    self.comprehensiveBtn = comprehensiveBtn;
    
    [comprehensiveBtn addTarget:self action:@selector(clickComprehensiveBtn:) forControlEvents:UIControlEventTouchUpInside];
    [comprehensiveBtn setTitle:@"综合" forState:UIControlStateNormal];
    [comprehensiveBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton *saleBtn =  [[UIButton alloc]init];
    [self addSubview:saleBtn];
    self.saleBtn = saleBtn;
    [saleBtn addTarget:self action:@selector(clickSaleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [saleBtn setTitle:@"销量" forState:UIControlStateNormal
     ];
    [saleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton *priceBtn = [[UIButton alloc]init];
    [self addSubview:priceBtn];
    self.priceBtn = priceBtn;
    [priceBtn addTarget:self action:@selector(clickPrcieBtn:) forControlEvents:UIControlEventTouchUpInside];
    [priceBtn setTitle:@"价格" forState:UIControlStateNormal];
    [priceBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // 布局
    [comprehensiveBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(8);
        make.bottom.equalTo(self).offset(-8);
        make.leading.equalTo(self);
        make.width.equalTo(saleBtn.width);
    }];
    
    [saleBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(8);
        make.bottom.equalTo(self).offset(-8);
        make.leading.equalTo(comprehensiveBtn.trailing);
        make.width.equalTo(priceBtn.width);
    }];
    
    [priceBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(8);
        make.bottom.equalTo(self).offset(-8);
        make.leading.equalTo(saleBtn.trailing);
        make.trailing.equalTo(self);
    }];
}

@end
