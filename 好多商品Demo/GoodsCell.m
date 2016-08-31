
//
//  GoodsCell.m
//  好多商品Demo
//
//  Created by 孙博 on 16/8/30.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "GoodsCell.h"
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface GoodsCell ()

@property (nonatomic, weak)UIImageView *icon;

@property (nonatomic, weak)UILabel *nameLabel;

@property (nonatomic, weak)UILabel *priceLabel;

@end


@implementation GoodsCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setModel:(DetailModel *)model{
    _model = model;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:model.img]];
    self.nameLabel.text = model.name;
    self.priceLabel.text = [NSString stringWithFormat:@"$%@",model.price];
}

- (void)setupUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imgView = [[UIImageView alloc]init];
    [self.contentView addSubview:imgView];
    self.icon = imgView;
    
    [imgView makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.equalTo(self.contentView);
        make.width.height.equalTo(self.contentView.width);
    }];
    
    UILabel *name = [[UILabel alloc]init];
    [self.contentView addSubview:name];
    name.font = [UIFont systemFontOfSize:15];
    name.numberOfLines = 0;
    self.nameLabel = name;
    
    [name makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(8);
        make.trailing.equalTo(self.contentView).offset(-8);
        make.top.equalTo(imgView.bottom).offset(5);
    }];
    
    UILabel *price = [[UILabel alloc]init];
    [self.contentView addSubview:price];
    price.font = [UIFont systemFontOfSize:15];
    price.textColor = [UIColor redColor];
    self.priceLabel = price;
    
    [price makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(8);
        make.bottom.equalTo(self.contentView).offset(-8);
    }];
}


@end
