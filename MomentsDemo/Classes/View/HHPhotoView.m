//
//  HHPhotoView.m
//  MomentsDemo
//
//  Created by 黄花菜 on 2020/7/31.
//  Copyright © 2020 Cai. All rights reserved.
//

#import "HHPhotoView.h"
#import <SDWebImage/SDWebImage.h>
#import "HHConst.h"

@implementation HHPhotoView

- (void)setPhotosArray:(NSArray *)photosArray {
    _photosArray = photosArray;
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat leftMargin = HHMargin * 2 + HHAvatarHeight;
    
    CGFloat photosWidth = screenWidth - (HHMargin * 2 + HHAvatarHeight) - leftMargin;
 
    CGFloat imageWidth = (photosWidth - 2 * HHMargin)/3;
    CGFloat imageHeight =  imageWidth;
    
    //单张图片的大小
    for (int i = 0; i < photosArray.count; ++i) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:photosArray[i]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        CGFloat x = (imageWidth + HHMargin) * (i % 3);
        CGFloat y = floorf(i/3.0) * (imageHeight + HHMargin);
        
        imageView.frame = CGRectMake(x,y,imageWidth, imageHeight);
        
        [self addSubview:imageView];
    }
}

@end
