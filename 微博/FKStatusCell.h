//
//  FKStatusCell.h
//  微博
//
//  Created by 123 on 15/9/21.
//  Copyright (c) 2015年 123. All rights reserved.
//

#import <UIKit/UIKit.h>

//把模型传递过来
//@class FKStatus;

//传递这个模型比上面那个好，这个包含了上面那个。
@class FKStatusFrame;

@interface FKStatusCell : UITableViewCell
//@property(nonatomic,strong)FKStatus *status;
@property (nonatomic,strong) FKStatusFrame *statusframe;
@end
