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
#import "HHMomentsLayout.h"

@interface HHMomentsTableViewCell ()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UITextView *messageTextView;
@property (nonatomic, strong) HHPhotoView *photoView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIView *dividerView;
@end

@implementation HHMomentsTableViewCell

#pragma mark - Intial Methods
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpSubViews];
        
        self.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:251/255.0 alpha:1.0];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setUpSubViews {
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.messageTextView];
    [self.contentView addSubview:self.photoView];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.dividerView];
}

- (void)setMoment:(HHMomentsModel *)moment {

    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:moment.icon] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    self.nameLabel.text = moment.name;
    
//    self.messageTextView.text = moment.content;
    
    if (moment.content) {
//        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//        paragraphStyle.lineSpacing = 5;// 字体的行间距
//        NSDictionary *attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:15],NSParagraphStyleAttributeName:paragraphStyle};
        self.messageTextView.attributedText = self.layout.messageAttStr;
    }

    self.photoView.photosArray = moment.photos;

    self.timeLabel.text = moment.time;
}

- (void)setLayout:(HHMomentsLayout *)layout {
    
    _layout = layout;
    
    [self setMoment:layout.moment];
    
    self.iconImageView.frame = layout.iconViewF;
    self.nameLabel.frame = layout.nameLableF;
    self.messageTextView.frame = layout.messageLabelF;
    self.photoView.frame = layout.photoContainerViewF;
    self.timeLabel.frame = layout.timeLabelF;
    self.dividerView.frame = layout.dividerF;
}

#pragma mark - Lazy

- (UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
//        _iconImageView.backgroundColor = [UIColor redColor];
    }
    return _iconImageView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = [UIColor colorWithRed:54/255.0 green:71/255.0 blue:121/255.0 alpha:1];
    }
    return _nameLabel;
}

- (UITextView *)messageTextView {
    if (_messageTextView == nil) {
        _messageTextView = [[UITextView alloc] init];
        _messageTextView.scrollEnabled = NO;
        //禁止编辑
        _messageTextView.editable = NO;
        //设置需要识别的类型，这设置的是全部
        _messageTextView.dataDetectorTypes = UIDataDetectorTypeAll;
    }
    return _messageTextView;
}

- (HHPhotoView *)photoView {
    if (_photoView == nil) {
        _photoView = [[HHPhotoView alloc] init];
//        _photoView.backgroundColor = [UIColor redColor];
    }
    return _photoView;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = [UIColor lightGrayColor];
        _timeLabel.font = [UIFont systemFontOfSize:13];
    }
    return _timeLabel;
}

- (UIView *)dividerView {
    if (_dividerView == nil) {
        _dividerView = [[UIView alloc] init];
//        _dividerView.backgroundColor = [UIColor grayColor];
        _dividerView.backgroundColor = [UIColor grayColor];
        _dividerView.alpha = 0.3;
    }
    return _dividerView;
}

+ (NSString *)identifier {
    return [NSString stringWithUTF8String:object_getClassName([self class])];
}

@end
