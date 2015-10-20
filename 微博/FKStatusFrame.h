//
//  FKStatusFrame.h
//  微博
//
//  Created by 123 on 15/9/22.
//  Copyright (c) 2015年 123. All rights reserved.
//
//这个模型对象专门用来存放cell内部所有的子控件的frame数据＋cell的高度
//一个cell就拥有一个FKStatusFrame模型
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class FKStatus;
@interface FKStatusFrame : NSObject
/*
 头像的frame
 */
@property(nonatomic,assign,readonly) CGRect iconF;

/*
 昵称的frame
 */
@property(nonatomic,assign,readonly) CGRect nameF;

/*
 会员的frame
 */
@property(nonatomic,assign,readonly) CGRect vipF;

/*
 正文的frame
 */
@property(nonatomic,assign,readonly) CGRect textF;

/*
 配图的frame
 */
@property(nonatomic,assign,readonly) CGRect pictureF;


/*
 cell的高度
 */
@property(nonatomic,assign) CGFloat cellHeight;//内容
@property(nonatomic,strong) FKStatus *status;

@end
