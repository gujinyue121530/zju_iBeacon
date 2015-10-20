//
//  FKStatusCell.m
//  微博
//
//  Created by 123 on 15/9/21.
//  Copyright (c) 2015年 123. All rights reserved.
//

#import "FKStatusCell.h"

//把模型传过来,重写set方法
#import "FKStatus.h"
#import  "FKStatusFrame.h"

@interface FKStatusCell()
//1.头像
@property(nonatomic,weak)UIImageView *iconView;
//2.昵称
@property(nonatomic,weak)UILabel *nameView;
//3.会员
@property(nonatomic,weak)UIImageView *vipView;
//4.正文
@property(nonatomic,weak)UILabel *textView;
//5.配图
@property(nonatomic,weak)UIImageView *pictureView;
@end

@implementation FKStatusCell
/*
 构造方法
 */
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self)
    {
        //1.头像
        UIImageView *iconView=[[UIImageView alloc]init];
        [self.contentView addSubview:iconView];
        self.iconView=iconView;
        
        //2.昵称
        UILabel *nameView=[[UILabel alloc]init];
        [self.contentView addSubview:nameView];
        nameView.font=[UIFont systemFontOfSize:14];
        //nameView.backgroundColor=[UIColor redColor];
        self.nameView=nameView;
        
        //3.会员
        UIImageView *vipView=[[UIImageView alloc]init];
        vipView.image=[UIImage imageNamed:@"vip"];
        [self.contentView addSubview:vipView];
        self.vipView=vipView;
        
        //4.正文
        UILabel *textView=[[UILabel alloc]init];
        [self.contentView addSubview:textView];
        textView.numberOfLines=0;
        textView.font=[UIFont systemFontOfSize:15];
        //textView.backgroundColor=[UIColor grayColor];
        self.textView=textView;
        
        //5.配图
        UIImageView *pictureView=[[UIImageView alloc]init];
        [self.contentView addSubview:pictureView];
        self.pictureView=pictureView;
        
    }
    return self;
}

////在这个方法中设置子控件的frame和显示数据
//-(void)setStatus:(FKStatusFrame *)statusFrame
//{
//    _statusframe=statusFrame;
//    
//    //1.设置数据
//    [self settingData];
//    //2.设置frame
//    [self settingFrame];
//    
//}
-(void)setStatusframe:(FKStatusFrame *)statusframe
{
    _statusframe=statusframe;
    
    //1.设置数据
    [self settingData];
    //2.设置frame
    [self settingFrame];
    
}
//设置数据
-(void)settingData
{
    FKStatus *status=self.statusframe.status;
    //1.头像
    self.iconView.image=[UIImage imageNamed:status.icon];
    //2.昵称
    self.nameView.text=status.name;
    //3.会员
    if(status.vip)
    {
        self.vipView.hidden=NO;
        //在这里比较耗费性能
       // self.vipView.image=[UIImage imageNamed:@"vip"];
        self.nameView.textColor=[UIColor redColor];
    }
    else
    {
        self.vipView.hidden=YES;
        self.nameView.textColor=[UIColor grayColor];
    }
    //4.正文
    self.textView.text=status.text;
    //5.配图
    if(status.picture)
    {
        self.pictureView.hidden=NO;
        self.pictureView.image=[UIImage imageNamed:status.picture];
    }
    else
    {
        self.pictureView.hidden=YES;
    }
    
    
}
-(void)settingFrame
{
    self.iconView.frame=self.statusframe.iconF;
    self.nameView.frame=self.statusframe.nameF;
    self.vipView.frame=self.statusframe.vipF;
    self.textView.frame=self.statusframe.textF;
    if(self.statusframe.status.picture)
    {
        self.pictureView.frame=self.statusframe.pictureF;
    }
//    //子控价之间的间距
//    CGFloat padding=10;
//    
//    //1.头像
//    CGFloat iconX=padding;
//    CGFloat iconY=padding;
//    CGFloat iconW=30;
//    CGFloat iconH=30;
//    self.iconView.frame=CGRectMake(iconX, iconY, iconW, iconH);
//    
//    
//    //2.昵称
//    //文字的字体
//    CGSize nameSize=[self sizeWithText:self.status.name font:[UIFont systemFontOfSize:14] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
//    
//    CGFloat nameX=CGRectGetMaxX(self.iconView.frame)+padding;
//    CGFloat nameY=iconY+(iconH-nameSize.height)*0.5;
//    self.nameView.frame=CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
//    
//    
//    //3.头像
//    CGFloat vipX=CGRectGetMaxX(self.nameView.frame)+padding;
//    CGFloat vipY=nameY;
//    CGFloat vipW=14;
//    CGFloat vipH=14;
//    self.vipView.frame=CGRectMake(vipX, vipY, vipW, vipH);
//    
//    
//    //4.正文
//    CGFloat textX = iconX;
//    CGFloat textY = CGRectGetMaxY(self.iconView.frame) + padding;
//    CGSize textSize = [self sizeWithText:self.status.text font:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(300, MAXFLOAT)];
//    self.textView.frame = CGRectMake(textX, textY, textSize.width, textSize.height);
//    
//    
//    //5.配图
//    if(self.status.picture)
//    {
//        CGFloat pictureX=textX;
//        CGFloat pictureY=CGRectGetMaxY(self.textView.frame)+padding;
//        CGFloat pictureW=100;
//        CGFloat pictureH=100;
//        self.pictureView.frame=CGRectMake(pictureX, pictureY, pictureW, pictureH);
//    }
}

////给我字体以及字体大小来计算文字尺寸
//-(CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
//{
//    NSDictionary *attrs=@{NSFontAttributeName:font};
//    
//    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
//}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
