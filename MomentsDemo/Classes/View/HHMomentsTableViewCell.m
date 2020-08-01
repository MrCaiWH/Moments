//
//  HHMomentsTableViewCell.m
//  MomentsDemo
//
//  Created by 黄花菜 on 2020/7/31.
//  Copyright © 2020 Cai. All rights reserved.
//

#import "HHMomentsTableViewCell.h"
#import "HHMomentsModel.h"
#import "HHPhotoView.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/SDWebImage.h>
#import <YYText/YYLabel.h>
#import "HHConst.h"

@interface HHMomentsTableViewCell ()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) YYLabel *messageLabel;
@property (nonatomic, strong) HHPhotoView *photoView;
@property (nonatomic, strong) UILabel *timeLabel;
@end

@implementation HHMomentsTableViewCell

#pragma mark - Intial Methods
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpSubViews];
        [self setupConstraint];

        self.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:251/255.0 alpha:1.0];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setUpSubViews {
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.messageLabel];
    [self.contentView addSubview:self.photoView];
    [self.contentView addSubview:self.timeLabel];
}

- (void)setupConstraint {
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(HHMargin);
        make.top.mas_equalTo(HHMargin);
        make.width.height.mas_equalTo(HHAvatarHeight);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(HHMargin);
        make.top.mas_equalTo(HHMargin);
        make.right.mas_equalTo(-HHMargin);
    }];
    
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(HHMargin * 2 + HHAvatarHeight);
        make.top.mas_equalTo(self.iconImageView.mas_bottom).offset(HHMargin);
        make.right.mas_equalTo(-HHMargin*2);
    }];
    
    [self.photoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(HHMargin * 2 + HHAvatarHeight);
        make.top.mas_equalTo(self.messageLabel.mas_bottom).offset(HHMargin);
        make.right.mas_equalTo(-(HHMargin * 2 + HHAvatarHeight));
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(HHMargin * 2 + HHAvatarHeight);
        make.bottom.mas_equalTo(self.contentView).offset(-HHMargin);
        make.right.mas_equalTo(-HHMargin);
//        make.height.mas_equalTo(30);
    }];
}

- (void)setModel:(HHMomentsModel *)model {
    _model = model;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    self.nameLabel.text = model.name;
    
    self.messageLabel.text = model.content;
    
    self.photoView.photosArray = model.photos;
    
    self.timeLabel.text = model.time;
}

#pragma mark - Lazy

- (UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.backgroundColor = [UIColor redColor];
    }
    return _iconImageView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:16.0];
        _nameLabel.backgroundColor = [UIColor redColor];
        _nameLabel.textColor = [UIColor colorWithRed:(54/255.0) green:(71/255.0) blue:(121/255.0) alpha:0.9];
    }
    return _nameLabel;
}

- (YYLabel *)messageLabel {
    if (_messageLabel == nil) {
        _messageLabel = [[YYLabel alloc] init];
        _messageLabel.numberOfLines = 0;
        _messageLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.frame) - 20;
        _messageLabel.backgroundColor = [UIColor blueColor];
    }
    return _messageLabel;
}

- (HHPhotoView *)photoView {
    if (_photoView == nil) {
        _photoView = [[HHPhotoView alloc] init];
        _photoView.backgroundColor = [UIColor redColor];
    }
    return _photoView;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:16.0];
        _timeLabel.backgroundColor = [UIColor redColor];
        _timeLabel.textColor = [UIColor colorWithRed:(54/255.0) green:(71/255.0) blue:(121/255.0) alpha:0.9];
    }
    return _timeLabel;
}

+ (NSString *)identifier {
    return [NSString stringWithUTF8String:object_getClassName([self class])];
}

@end
