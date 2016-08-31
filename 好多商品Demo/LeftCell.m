//
//  LeftCell.m
//  好多商品Demo
//
//  Created by 孙博 on 16/8/29.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "LeftCell.h"
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface LeftCell ()

@property (nonatomic, weak)UILabel *nameLabel;
/**做变黄色图片*/
@property (nonatomic,strong) UIImageView *iv_imageView;
/**作为分隔线*/
@property (nonatomic,strong) UIView *separaterView;

@end


@implementation LeftCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return  self;
}

- (void)setModel:(CatalogueModel *)model{
    _model = model;
    self.nameLabel.text = model.name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    self.iv_imageView.hidden = !selected;
    self.contentView.backgroundColor = !selected ? [UIColor colorWithRed:(235)/256.0 green:(235)/256.0 blue:(235)/256.0 alpha:1.0] : [UIColor whiteColor];
}

#pragma
#pragma mark - 设置UI -
- (void)setupUI{
    
    self.contentView.backgroundColor = [UIColor grayColor];
    CGFloat scale = [UIScreen mainScreen].bounds.size.width / 375;
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:15 *scale];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    [self.contentView addSubview:label];
    self.nameLabel = label;
    
    UIView *seperator = [[UIView alloc]init];
    seperator.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:seperator];
    seperator.backgroundColor = [UIColor colorWithRed:(218)/256.0 green:(218)/256.0 blue:(218)/256.0 alpha:1.0];
    self.separaterView = seperator;
    
    UIImageView *imgView = [[UIImageView alloc]init];
    imgView.image = [UIImage imageNamed:@"v2_coupon_verify_normal"];
    [self.contentView addSubview:imgView];
    self.iv_imageView = imgView;
    
    self.iv_imageView.hidden = YES;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    //------ 控件约束
    [self.nameLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.leading.equalTo(self).offset(10);
    }];
    
    [self.separaterView makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(0);
        make.height.equalTo(0.4);
    }];

    [self.iv_imageView makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self);
        make.top.width.equalTo(5);
        make.bottom.equalTo(-5);
    }];
}

@end
