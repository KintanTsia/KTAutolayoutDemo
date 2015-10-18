//
//  StatusModel.m
//  KTAutoLayoutDemo
//
//  Created by Kintan on 15-10-18.
//  Copyright (c) 2015年 Kintan. All rights reserved.
//

#import "StatusModel.h"

@implementation StatusModel
+ (instancetype)feedWithDictionary:(NSDictionary *)dictionary {
    
    return [[self alloc] initWithDictionary:dictionary];
}


- (instancetype) initWithDictionary:(NSDictionary *) dictionary {
    
    if (self = [super init]) {
        
        self.title = dictionary[@"title"];
        self.content = dictionary[@"content"];
        self.username = dictionary[@"username"];
        self.time = dictionary[@"time"];
        self.imageName = dictionary[@"imageName"];
        self.icon = dictionary[@"icon"];
        self.type = dictionary[@"type"];
    }
    return self;
}
@end
