//
//  StatusCell.h
//  KTAutoLayoutDemo
//
//  Created by Kintan on 15-10-18.
//  Copyright (c) 2015年 Kintan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StatusModel;
@interface StatusCell : UITableViewCell

@property (strong, nonatomic) StatusModel *status;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
