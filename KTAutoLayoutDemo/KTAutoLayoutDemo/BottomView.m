//
//  BottomView.m
//  KTAutoLayoutDemo
//
//  Created by Kintan on 15-10-18.
//  Copyright (c) 2015年 Kintan. All rights reserved.
//

#import "BottomView.h"
#import "StatusModel.h"
#import "Masonry.h"

@interface BottomView ()

@property (strong, nonatomic) UIButton *likeBtn; // 红心按钮
@property (nonatomic,strong) UIButton *commentBtn; // 评论按钮
@end

@implementation BottomView

- (instancetype)init
{
    if (self = [super init]) {
        self.likeBtn.translatesAutoresizingMaskIntoConstraints = NO;
        self.commentBtn.translatesAutoresizingMaskIntoConstraints = NO;
        
        self.likeBtn = [[UIButton alloc] init];
        [self.likeBtn setImage:[UIImage imageNamed:@"赞-灰"] forState:UIControlStateNormal];
        [self.likeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        self.likeBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        self.likeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self.likeBtn addTarget:self action:@selector(likeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.likeBtn];
        
        self.commentBtn = [[UIButton alloc] init];
        [self.commentBtn setImage:[UIImage imageNamed:@"评论-灰"] forState:UIControlStateNormal];
        [self.commentBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        self.commentBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        self.commentBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.commentBtn];
        
        [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top);
            make.left.equalTo(self.mas_left);
            make.width.mas_equalTo(@44);
            make.bottom.mas_equalTo(self.mas_bottom);
        }];
        
        [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.likeBtn);
            make.left.equalTo(self.likeBtn.mas_right);
            make.top.equalTo(self.likeBtn);
        }];
    }
    return self;
}

- (void)setStatus:(StatusModel *)status
{
    _status = status;
    
    [self.likeBtn setTitle:[NSString stringWithFormat:@"%zd",status.username.length] forState:UIControlStateNormal];
    [self.commentBtn setTitle:[NSString stringWithFormat:@"%zd",status.title.length] forState:UIControlStateNormal];
}

- (void)likeBtnClick
{
    self.likeBtn.selected = !self.likeBtn.selected;
}

@end

