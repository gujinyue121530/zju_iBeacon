//
//  ViewController.m
//  微博
//
//  Created by 123 on 15/9/21.
//  Copyright (c) 2015年 123. All rights reserved.
//
/*
 1.新建一个继承自UITableViewCell的类
 2.先在initWithStyle  方法中添加所有需要显示的控件
 3.提供一个模型属性,重写模型的set方法
 4.在这个方法中设置子控件的内容
 */

#import "ViewController.h"
#import "FKStatus.h"
#import "FKStatusCell.h"
#import "FKStatusFrame.h"

@interface ViewController ()
//@property(nonatomic,strong)NSArray *statuses;
/*
 存放所有cell的frame模型数据
 */
@property(nonatomic,strong)NSArray *statusFrames;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.tableView.rowHeight=200;
}

//懒加载
-(NSArray *)statusFrames
{
    if(_statusFrames==nil)
    {
        //获取文件所在的路径
        NSBundle *bundle=[NSBundle mainBundle];
        NSString *path=[bundle pathForResource:@"statuses" ofType:@"plist"];
        //获取文件的内容
        NSArray *dictArray=[NSArray arrayWithContentsOfFile:path];
        
        //将dictArray里面的所有字典转换成模型对象,放到新的数组中
        NSMutableArray *statusFrameArray=[NSMutableArray array];
        for(NSDictionary *dict in dictArray)
        {
            //创建FKStatus模型对象
            FKStatus *status=[FKStatus weiboWithDict:dict];
            
            //创建FKStatusFrame模型对象
            FKStatusFrame *statusFrame=[[FKStatusFrame alloc]init];
            statusFrame.status=status;
            
            //添加模型对象到数组中
            [statusFrameArray addObject:statusFrame];
        }
        _statusFrames=statusFrameArray;
    }
    return _statusFrames;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

//实现数据源方法
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId=@"cellId";
    FKStatusCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(cell==nil)
    {
        cell=[[FKStatusCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    //在这里算好了cell的高度
    cell.statusframe=self.statusFrames[indexPath.row];
    
    return cell;
}

////实现代理方法
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //拿到每一行cell的高度（需要拿到cell内部的子控件才能计算cell的高度）
    
    //取出这行对应的frame模型
    FKStatusFrame *statusFrame=self.statusFrames[indexPath.row];
    return statusFrame.cellHeight;
}


@end
