//
//  WHMyMessageTableViewCell.m
//  MyShop
//
//  Created by 王辉 on 2017/10/26.
//  Copyright © 2017年 ronaldo. All rights reserved.
//

#import "WHMyMessageTableViewCell.h"

@interface WHMyMessageTableViewCell()

@property(nonatomic,strong) UIImageView *iconImage;   /**图标*/
@property(nonatomic,strong) UILabel *titleLabel;   /**cell中显示文字的label*/
@property(nonatomic,strong) UIImageView *nextImage;   /**下一步image*/
@property(nonatomic,strong) UILabel *lineLabel;   /**分割线*/

@end
@implementation WHMyMessageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.iconImage];
        [self addSubview:self.titleLabel];
        [self addSubview:self.nextImage];
        [self addSubview:self.lineLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof (self) wealSelf = self;
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.centerY.equalTo(wealSelf.mas_centerY);
        make.left.equalTo(wealSelf.mas_left).offset(15);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(CGSizeMake(140, 15));
        make.centerY.equalTo(wealSelf.mas_centerY);
        make.left.equalTo(wealSelf.iconImage.mas_right).offset(15);
    }];
    [_nextImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(10, 15));
        make.centerY.equalTo(wealSelf.mas_centerY);
        make.right.equalTo(wealSelf.mas_right).offset(-15);
    }];
    //小bug分割线为啥和icon图左对齐片
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.equalTo(wealSelf.titleLabel.mas_left);
        make.right.equalTo(wealSelf.mas_right);
        make.bottom.equalTo(wealSelf.mas_bottom);
    }];
}

- (void)setSourceDict:(NSDictionary *)sourceDict{
    _iconImage.image = [UIImage imageNamed:sourceDict[@"image"]];
    _titleLabel.text = sourceDict[@"title"];
}

- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc] init];
    }
    return _iconImage;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15.0f];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}
- (UIImageView *)nextImage{
    if (!_nextImage) {
        _nextImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"下一步"]];
    }
    return _nextImage;
}
- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.backgroundColor = mainColor;
    }
    return _lineLabel;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
