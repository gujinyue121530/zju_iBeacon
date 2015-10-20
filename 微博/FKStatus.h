//
//  FKStatues.h
//  微博
//
//  Created by 123 on 15/9/21.
//  Copyright (c) 2015年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FKStatus : NSObject

@property(nonatomic,copy)NSString *text;//内容

@property(nonatomic,copy)NSString *icon;//头像

@property(nonatomic,copy)NSString *name;//昵称

@property(nonatomic,copy)NSString *picture;//配图

@property(nonatomic,assign)BOOL vip;

+(instancetype)weiboWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;

@end
