//
//  MidView.m
//  KTAutoLayoutDemo
//
//  Created by Kintan on 15-10-18.
//  Copyright (c) 2015年 Kintan. All rights reserved.
//

#import "MidView.h"
#import "StatusModel.h"
#import "Masonry.h"
#import "ImageSView.h"

@interface MidView ()
@property (nonatomic,strong) UIView *pushGroup; // 公众号动态组别
@property (strong, nonatomic) UIImageView *pictureView; // 配图
@property (strong, nonatomic) UILabel *detailLabel; // 详情

@property (nonatomic,strong) UIView *contentGroup; // 用户动态
@property (nonatomic,strong) UIView *paddingLine; // 分割线
@property (strong, nonatomic) UILabel *contentLabel; // 用户发送动态内容
//@property (nonatomic,strong) ImageSView *imageShow; // 九宫格图片 需要注释下面的同名
@property (nonatomic,strong) UIImageView *imageShow; // 图片

@property (nonatomic, strong) MASConstraint *cUser; // 用户的高度约束
@property (nonatomic, strong) MASConstraint *cPush; // 公众号的高度约束
@property (nonatomic, strong) MASConstraint *cUser1; // 用户的高度约束
@property (nonatomic, strong) MASConstraint *cPush1; // 公众号的高度约束
@end

@implementation MidView

- (instancetype)init
{
    if (self = [super init]) {
        
        self.pushGroup.translatesAutoresizingMaskIntoConstraints = NO;
        self.contentGroup.translatesAutoresizingMaskIntoConstraints = NO;
        self.pictureView.translatesAutoresizingMaskIntoConstraints = NO;
        self.detailLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.paddingLine.translatesAutoresizingMaskIntoConstraints = NO;
        self.contentLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.imageShow.translatesAutoresizingMaskIntoConstraints = NO;
        /** 公众号推送 **/
        self.pushGroup = [[UIView alloc] init];
        self.pushGroup.layer.cornerRadius = 3;
        self.pushGroup.clipsToBounds = YES;
        [self addSubview:self.pushGroup];
        
        self.pictureView = [[UIImageView alloc] init];
        self.pictureView.contentMode = UIViewContentModeScaleAspectFill;
        [self.pushGroup addSubview:self.pictureView];
        
        self.detailLabel = [[UILabel alloc] init];
        self.detailLabel.numberOfLines = 0;
        self.detailLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        self.detailLabel.textColor = [UIColor whiteColor];
        self.detailLabel.font = [UIFont boldSystemFontOfSize:18];
        [self.pushGroup addSubview:self.detailLabel];
        
        /** 个人发送动态 **/
        self.contentGroup = [[UIView alloc] init];
        self.contentGroup.layer.cornerRadius = 3;
        self.contentGroup.clipsToBounds = YES;
        [self addSubview:self.contentGroup];
        
        
        self.paddingLine = [[UIView alloc] init];
        self.paddingLine.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        [self.contentGroup addSubview:self.paddingLine];
        
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.font = [UIFont systemFontOfSize:14];
        self.contentLabel.textColor = [UIColor lightGrayColor];
        [self.contentGroup addSubview:self.contentLabel];
        
//        self.imageShow = [[ImageSView alloc] init];
        self.imageShow = [[UIImageView alloc] init];
        self.imageShow.contentMode = UIViewContentModeScaleAspectFit;
        self.imageShow.layer.cornerRadius = 3;
        self.imageShow.clipsToBounds = YES;
        [self.contentGroup addSubview:self.imageShow];
        
        /** 个人发送动态 **/
        [self.contentGroup mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(7);
            make.left.mas_equalTo(self);
            make.right.mas_equalTo(self);
            self.cPush = make.bottom.mas_equalTo(self.pushGroup.mas_top).priority(UILayoutPriorityRequired);
            [self.cPush activate];
        }];
        
        [self.paddingLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentGroup.mas_top);
            make.left.mas_equalTo(self.contentGroup).offset(6);
            make.height.mas_equalTo(@1);
            make.right.mas_equalTo(self.contentGroup).offset(-6);
        }];
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.paddingLine.mas_bottom).offset(6);
            make.left.mas_equalTo(self.contentGroup).offset(3);
            make.right.mas_equalTo(self.contentGroup).offset(-3);
        }];
        
        [self.imageShow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentLabel.mas_bottom).offset(6);
            make.left.mas_equalTo(self.contentLabel);
            make.right.mas_equalTo(self.contentLabel);
            make.height.mas_equalTo(@110);
            self.cUser1 = make.bottom.mas_equalTo(self.contentGroup.mas_bottom).priority(UILayoutPriorityRequired);
            [self.cUser1 activate];
        }];
        
        /** 公众号推送 **/
        [self.pushGroup mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentGroup.mas_bottom);
            make.left.mas_equalTo(self.mas_left);
            make.right.mas_equalTo(self.mas_right);
            self.cPush1 = make.bottom.mas_equalTo(self.mas_bottom).priority(UILayoutPriorityRequired);
            self.cPush = make.height.mas_equalTo(@185).priority(UILayoutPriorityRequired);
            [self.cPush activate];
            [self.cPush1 activate];
        }];
        
        [self.pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.pushGroup.mas_left);
            make.top.mas_equalTo(self.pushGroup.mas_top);
            make.right.equalTo(self.pushGroup.mas_right);
            make.bottom.mas_equalTo(self.pushGroup.mas_bottom);
        }];
        
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.pictureView);
            make.bottom.mas_equalTo(self.pictureView);
            make.right.equalTo(self.pictureView);
            make.height.mas_equalTo(@25);
        }];
    }
    return self;
}
- (void)setStatus:(StatusModel *)status
{
    _status = status;
    
    if ([status.type isEqual:@"1"]) { // 系统推送
#pragma 推送
        self.pushGroup.hidden = NO;
        self.contentGroup.hidden = YES;
        [self.cUser deactivate];
        [self.cUser1 deactivate];
        [self.pushGroup mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(@185);
        }];
        self.pictureView.image = status.imageName.length > 0 ? [UIImage imageNamed:status.imageName] : nil;
        self.detailLabel.text = status.title;
//        self.imageShow.hidden = YES;
    } else { // 用户发送
#pragma 用户
        self.pushGroup.hidden = YES;
        self.contentGroup.hidden = NO;
        [self.pushGroup mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(@0);
        }];
        [self.cUser activate];
        [self.cUser1 activate];
        self.contentLabel.text = status.content;
        self.imageShow.image = status.imageName.length > 0 ? [UIImage imageNamed:status.imageName] : nil;
//        self.imageShow.hidden = NO;
//        self.imageShow.status = status;
    }
}


@end

