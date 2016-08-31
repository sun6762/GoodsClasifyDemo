//
//  RightCell.m
//  好多商品Demo
//
//  Created by 孙博 on 16/8/29.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "RightCell.h"
#import "UIImageView+WebCache.h"


//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface RightCell ()

@property (nonatomic, weak)UIImageView *icon;

@property (nonatomic, weak)UILabel *nameLable;

@property (nonatomic, weak)UILabel *priceLabel;

@property (nonatomic, weak)UIButton *increaseBtn;

@property (nonatomic, weak)UIButton *decreaseBtn;

@property (nonatomic, weak)UILabel *countLable;
/**作为分隔线*/
@property (nonatomic,strong) UIView *separaterView;
@end

@implementation RightCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setModel:(DetailModel *)model{
    _model = model;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:model.img]];
    self.nameLable.text = model.name;
    self.priceLabel.text = [NSString stringWithFormat:@"$%@",model.price];
}

#pragma
#pragma mark - 点击按钮 - 
- (void)clickToIncrease{
    
}

#pragma
#pragma mark - 设置UI -
- (void)setupUI{
//    self.contentView.backgroundColor = [UIColor orangeColor];
    // 图
    UIImageView *icon = [[UIImageView alloc]init];
    [self.contentView addSubview:icon];
    self.icon = icon;
    
    [icon makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.leading.equalTo(self.contentView).offset(10);
        make.width.equalTo(self.height);
    }];
    
    // 名称
    UILabel *name = [[UILabel alloc]init];
    [self.contentView addSubview:name];
    name.textAlignment = NSTextAlignmentLeft;
    name.textColor = [UIColor blackColor];
    name.font = [UIFont systemFontOfSize:15];
    self.nameLable = name;
    
    [name makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(icon.trailing).offset(10);
        make.top.equalTo(self.contentView).offset(8);
    }];
    
    // 价格
    UILabel *price = [[UILabel alloc]init];
    [self.contentView addSubview:price];
    price.textColor = [UIColor redColor];
    price.font = [UIFont systemFontOfSize:14];
    self.priceLabel = price;
    
    [price makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(icon.trailing).offset(10);
        make.bottom.equalTo(self.contentView.bottom).offset(-8);
    }];
    
    // 减少
    
    // 增加
    UIButton *increase = [[UIButton alloc]init];
    [self.contentView addSubview:increase];
    [increase setTitle:@" + " forState:UIControlStateNormal];
    [increase setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        // 点击添加按钮
    [increase addTarget:self action:@selector(clickToIncrease) forControlEvents:UIControlEventTouchUpInside];
    self.increaseBtn = increase;
    
    [increase sizeToFit];
    [increase makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.contentView.trailing).offset(-10);
        make.bottom.equalTo(self.contentView.bottom).offset(-5);
    }];
    
    // 购买数量
    
    // 分割线
    UIView *seperator = [[UIView alloc]init];
    seperator.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:seperator];
    seperator.backgroundColor = [UIColor colorWithRed:(218)/256.0 green:(218)/256.0 blue:(218)/256.0 alpha:1.0];
    self.separaterView = seperator;
    
    [self.separaterView makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(0);
        make.height.equalTo(0.4);
    }];
    
}

@end
