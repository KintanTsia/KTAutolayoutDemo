//
//  TableViewController.m
//  KTAutoLayoutDemo
//
//  Created by Kintan on 15-10-18.
//  Copyright (c) 2015年 Kintan. All rights reserved.
//

#import "TableViewController.h"
#import "StatusModel.h"
#import "StatusCell.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface TableViewController ()

@property (nonatomic,strong) NSMutableArray *status; // 动态模型
@end

@implementation TableViewController

- (NSMutableArray *)status
{
    if (!_status) {
        _status = [NSMutableArray array];
    }
    return _status;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self jsonData];
}

#pragma mark - 加载json数据
- (void)jsonData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"]; // 解析json
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *jsonArray = dict[@"status"];
    
    NSMutableArray *arrM = [NSMutableArray array];
    
    [jsonArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [arrM addObject:[StatusModel feedWithDictionary:obj]];
    }];
    
    self.status = arrM;
    
    [self.tableView registerClass:[StatusCell class] forCellReuseIdentifier:@"status"];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.status.count;;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    StatusCell *cell = [StatusCell cellWithTableView:tableView];
    cell.status = self.status[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [self.tableView fd_heightForCellWithIdentifier:@"status" cacheByIndexPath:indexPath configuration:^(StatusCell *cell) {
        cell.status = self.status[indexPath.row];
    }];
}

@end
