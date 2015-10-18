//
//  TopView.m
//  KTAutoLayoutDemo
//
//  Created by Kintan on 15-10-18.
//  Copyright (c) 2015年 Kintan. All rights reserved.
//

#import "TopView.h"
#import "Masonry.h"
#import "StatusModel.h"

@interface TopView ()
@property (strong, nonatomic) UIImageView *iconView; // 头像
@property (strong, nonatomic) UILabel *nicktermLabel; // 昵称
@property (strong, nonatomic) UILabel *termLabel; // 用户衔头
@property (strong, nonatomic) UILabel *leavlLabel; // 等级
@property (strong, nonatomic) UILabel *timeLabel; // 时间
@property (nonatomic,strong) UIButton *groupType; // 所处小组
@end

@implementation TopView

- (instancetype)init
{
    if (self = [super init]) {
        
        self.iconView.translatesAutoresizingMaskIntoConstraints = NO;
        self.nicktermLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.groupType.translatesAutoresizingMaskIntoConstraints = NO;
        self.timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.termLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.leavlLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        self.iconView = [[UIImageView alloc] init];
        self.iconView.layer.cornerRadius = 20;
        self.iconView.clipsToBounds = YES;
        self.iconView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.iconView];
        
        self.nicktermLabel = [[UILabel alloc] init];
        self.nicktermLabel.font = [UIFont boldSystemFontOfSize:18];
        self.nicktermLabel.textColor = [UIColor orangeColor];
        [self addSubview:self.nicktermLabel];
        
        self.termLabel = [[UILabel alloc] init];
        self.termLabel.font = [UIFont systemFontOfSize:14];
        self.termLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:self.termLabel];
        
        self.leavlLabel = [[UILabel alloc] init];
        self.leavlLabel.textColor = [UIColor lightGrayColor];
        self.leavlLabel.font = [UIFont systemFontOfSize:14];
        self.leavlLabel.numberOfLines = 0;
        [self addSubview:self.leavlLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont systemFontOfSize:13];
        self.timeLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:self.timeLabel];
        
        
        self.groupType = [[UIButton alloc] init]; // 这个是现实用户是在那个讨论组里面的
        [self.groupType setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.groupType.backgroundColor = [UIColor colorWithRed:82/255.0 green:159/255.0 blue:253/255.0 alpha:1];
        self.groupType.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        self.groupType.layer.cornerRadius = 13;
        self.groupType.clipsToBounds = YES;
        [self addSubview:self.groupType];
        
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.mas_equalTo(self);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        
        [self.nicktermLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconView);
            make.left.equalTo(self.iconView.mas_right).offset(10);
        }];
        
        [self.termLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.nicktermLabel);
            make.left.mas_equalTo(self.nicktermLabel.mas_right).offset(8);
        }];
        
        [self.leavlLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.nicktermLabel);
            make.left.equalTo(self.termLabel.mas_right).offset(5);
        }];
        
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nicktermLabel);
            make.top.equalTo(self.nicktermLabel.mas_bottom).offset(4);
        }];
        
        [self.groupType mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.iconView.mas_centerY);
            make.height.mas_equalTo(@26);
            make.width.mas_equalTo(@65);
            make.right.mas_equalTo(self).offset(-6);
        }];
        
    }
    return self;
}

- (void)setStatus:(StatusModel *)status
{
    _status = status;
    
    self.iconView.image = [UIImage imageNamed:status.icon];
    self.nicktermLabel.text = status.username;
    self.timeLabel.text = status.time;
    self.termLabel.text = @"先锋博主";
    self.leavlLabel.text = @"LV:23";
    [self.groupType setTitle:@"时尚丽人" forState:UIControlStateNormal];
}

@end
