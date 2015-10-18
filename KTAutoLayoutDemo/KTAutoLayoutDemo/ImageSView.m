//
//  ImageSView.m
//  KTAutoLayoutDemo
//
//  Created by Kintan on 15-10-18.
//  Copyright (c) 2015年 Kintan. All rights reserved.
//

#import "ImageSView.h"
#import "UIView+Extension.h"
#import "StatusModel.h"
#define KFollowRandomColor [UIColor colorWithRed:(arc4random_uniform(256))/255.0 green:(arc4random_uniform(256))/255.0 blue:(arc4random_uniform(256))/255.0 alpha:1.0]

@implementation ImageSView

- (instancetype)init
{
    if (self = [super init]) {
        for (int i = 0; i < 3; i++) {
            UIImageView *imageV = [[UIImageView alloc] init];
            imageV.layer.cornerRadius = 6;
            imageV.clipsToBounds = YES;
            imageV.backgroundColor = KFollowRandomColor;
            [self addSubview:imageV];
        }
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat wi = (self.width - (3 - 1)*5)/3;
    CGFloat he = wi;
    CGFloat ys = (self.height - wi) * 0.5;
    for (int i = 0; i < 3; i++) {
        UIImageView *imageV = self.subviews[i];
        
        imageV.height = he;
        imageV.width = wi;
        imageV.x = i * (wi + 5);
        imageV.y = ys;
    }
}

- (void)setStatus:(StatusModel *)status
{
    _status = status;
    for (int i = 0; i < self.subviews.count; i++) {
        UIImageView *imageV = self.subviews[i];
        imageV.image = status.imageName.length > 0 ? [UIImage imageNamed:status.imageName] : nil;
    }
}

@end
