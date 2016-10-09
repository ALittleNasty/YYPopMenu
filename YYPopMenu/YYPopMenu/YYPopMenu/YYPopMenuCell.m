//
//  YYPopMenuCell.m
//  YYPopMenu
//
//  Created by ALittleNasty on 16/10/8.
//  Copyright © 2016年 vcredit. All rights reserved.
//

#import "YYPopMenuCell.h"

@interface YYPopMenuCell ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineViewHeightCons;
@property (weak, nonatomic) IBOutlet UIView *bottomLine;

@end

@implementation YYPopMenuCell

- (void)awakeFromNib {
    // Initialization code
    
    float systemValue = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (systemValue >= 10.0) {
        [super awakeFromNib];
    }
    
    self.lineViewHeightCons.constant = .5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setHideBottomLine:(BOOL)hideBottomLine
{
    _hideBottomLine = hideBottomLine;
    if (_hideBottomLine) {
        self.bottomLine.hidden = YES;
    } else {
        self.bottomLine.hidden = NO;
    }
}

+ (UINib *)nib
{
    return [UINib nibWithNibName:@"YYPopMenuCell" bundle:nil];
}

@end
