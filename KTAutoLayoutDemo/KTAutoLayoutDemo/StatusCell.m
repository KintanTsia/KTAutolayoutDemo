//
//  StatusCell.m
//  KTAutoLayoutDemo
//
//  Created by Kintan on 15-10-18.
//  Copyright (c) 2015年 Kintan. All rights reserved.
//

#import "StatusCell.h"
#import "Masonry.h"
#import "StatusModel.h"
#import "TopView.h"
#import "MidView.h"
#import "BottomView.h"

@interface StatusCell ()

@property (nonatomic,strong) UIView *cellGroup; // 底板
@property (nonatomic,strong) TopView *topGroup; // 顶部组别
@property (nonatomic,strong) MidView *midGroup; // 中部组别
@property (nonatomic,strong) BottomView *bottomGroup; // 底部组别
@property (assign, nonatomic) BOOL didSetupConstraints; // 判断是否已加过约束

@end

@implementation StatusCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"status";
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[StatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor grayColor];
        [self createView];
        [self updateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        [self setttingViewAtuoLayout];
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

#pragma make 创建子控件
- (void) createView
{
#pragma mark - 共有的
    self.cellGroup = [[UIView alloc] init];
    self.cellGroup.translatesAutoresizingMaskIntoConstraints = NO;
    self.cellGroup.layer.cornerRadius = 3;
    self.cellGroup.clipsToBounds = YES;
    self.cellGroup.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.cellGroup];
    
#pragma mark - 头部
    self.topGroup = [[TopView alloc] init];
    self.topGroup.translatesAutoresizingMaskIntoConstraints = NO;
    self.topGroup.layer.cornerRadius = 3;
    self.topGroup.clipsToBounds = YES;
    self.topGroup.backgroundColor = [UIColor whiteColor];
    [self.cellGroup addSubview:self.topGroup];
    
#pragma mark - 公众号推送
    self.midGroup = [[MidView alloc] init];
    self.midGroup.translatesAutoresizingMaskIntoConstraints = NO;
    self.midGroup.layer.cornerRadius = 3;
    self.midGroup.clipsToBounds = YES;
    self.midGroup.backgroundColor = [UIColor whiteColor];
    [self.cellGroup addSubview:self.midGroup];
    
#pragma mark - 底部组别
    self.bottomGroup = [[BottomView alloc] init];
    self.bottomGroup.translatesAutoresizingMaskIntoConstraints = NO;
    self.bottomGroup.layer.cornerRadius = 3;
    self.bottomGroup.clipsToBounds = YES;
    self.bottomGroup.backgroundColor = [UIColor whiteColor];
    [self.cellGroup addSubview:self.bottomGroup];
}

#pragma mark - 在此方法内使用 Masonry 设置控件的约束
- (void) setttingViewAtuoLayout
{
    [self top];
    [self mid];
    [self bottom];
}

- (void)setStatus:(StatusModel *)status
{
    _status = status;
    self.topGroup.status = status;
    self.midGroup.status = status;
    self.bottomGroup.status = status;
}

- (void)top
{
    [self.cellGroup mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(7);
        make.left.mas_equalTo(self.contentView).offset(10);
        make.bottom.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).offset(-10);
    }];
    
    [self.topGroup mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.cellGroup).offset(10);
        make.left.mas_equalTo(self.cellGroup).offset(10);
        make.right.mas_equalTo(self.cellGroup).offset(-10);
        make.height.mas_equalTo(40);
    }];
}

- (void)mid
{
    [self.midGroup mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topGroup.mas_bottom);
        make.left.mas_equalTo(self.cellGroup).offset(10);
        make.right.mas_equalTo(self.cellGroup).offset(-10);
        make.bottom.mas_equalTo(self.bottomGroup.mas_top);
    }];
}

- (void)bottom
{
    [self.bottomGroup mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.cellGroup).offset(10);
        make.right.mas_equalTo(self.cellGroup).offset(-10);
        make.height.mas_equalTo(@33);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
}

@end

