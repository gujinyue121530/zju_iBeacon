//
//  FKStatues.m
//  微博
//
//  Created by 123 on 15/9/21.
//  Copyright (c) 2015年 123. All rights reserved.
//

#import "FKStatus.h"

@implementation FKStatus
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if(self=[super init])
    {
        self.name=dict[@"name"];
        self.vip=[dict[@"vip"] boolValue];
        self.picture=dict[@"picture"];
        self.icon=dict[@"icon"];
        self.text=dict[@"text"];
    }
    return self;
}
+(instancetype)weiboWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
