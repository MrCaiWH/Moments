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
#import <YBImageBrowser/YBImageBrowser.h>

@interface HHPhotoView ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation HHPhotoView

- (void)setPhotosArray:(NSArray *)photosArray {
    
    _photosArray = photosArray;

    //解决复用问题
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat leftMargin = HHMargin * 2 + HHAvatarHeight;
    
    CGFloat photosWidth = screenWidth - (HHMargin * 2 + HHAvatarHeight) - leftMargin;
 
    CGFloat imageWidth = (photosWidth - 2 * HHMargin)/3;
    CGFloat imageHeight =  imageWidth;
    
    //单张图片的大小
    for (int i = 0; i < photosArray.count; ++i) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.userInteractionEnabled = YES;
        imageView.tag = i;
        [imageView sd_setImageWithURL:[NSURL URLWithString:photosArray[i]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        CGFloat x = (imageWidth + HHMargin) * (i % 3);
        CGFloat y = floorf(i/3.0) * (imageHeight + HHMargin);
        
        imageView.frame = CGRectMake(x,y,imageWidth, imageHeight);
        
        [self addSubview:imageView];
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageAction:)];
        [imageView addGestureRecognizer:singleTap];
        
        if (photosArray.count == 1) {
            imageView.frame = CGRectMake(x,y,imageWidth * 2, imageHeight * 2);
        }
    }
}

-(void)tapImageAction:(UITapGestureRecognizer *)tap {
    UIImageView *tapView = (UIImageView *)tap.view;

    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < self.photosArray.count; ++i) {
        YBIBImageData *data1 = [YBIBImageData new];
        data1.imageURL = [NSURL URLWithString:self.photosArray[i]];
        data1.projectiveView = tapView;
        [dataArray addObject:data1];
    }
    
    YBImageBrowser *browser = [YBImageBrowser new];
    browser.dataSourceArray = dataArray;
    browser.currentPage = tapView.tag;
    //展示
    [browser show];
}

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}
@end
