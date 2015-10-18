//
//  StatusModel.h
//  KTAutoLayoutDemo
//
//  Created by Kintan on 15-10-18.
//  Copyright (c) 2015年 Kintan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatusModel : NSObject
@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *content;
@property (copy, nonatomic) NSString *imageName;
@property (copy, nonatomic) NSString *time;
@property (copy, nonatomic) NSString *icon;
@property (copy, nonatomic) NSString *type;

+ (instancetype) feedWithDictionary:(NSDictionary *) dictionary;

- (instancetype) initWithDictionary:(NSDictionary *) dictionary;
@end
