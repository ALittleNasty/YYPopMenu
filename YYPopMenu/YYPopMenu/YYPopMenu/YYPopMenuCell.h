//
//  YYPopMenuCell.h
//  YYPopMenu
//
//  Created by ALittleNasty on 16/10/8.
//  Copyright © 2016年 vcredit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYPopMenuCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *logoImage;
@property (weak, nonatomic) IBOutlet UILabel *mTitleLabel;

@property (assign, nonatomic) BOOL hideBottomLine;

+ (UINib *)nib;

@end
