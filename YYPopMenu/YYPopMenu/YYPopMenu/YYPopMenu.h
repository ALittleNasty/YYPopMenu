//
//  YYPopMenu.h
//  YYPopMenu
//
//  Created by ALittleNasty on 16/10/8.
//  Copyright © 2016年 vcredit. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^YYPopMenuCallBack)(NSInteger index);

@interface YYPopMenu : UIView

@property (nonatomic, copy) YYPopMenuCallBack tapAction;

/**
 *  初始化弹框按钮
 *
 *  @param position 位置<x为按钮的中心点位于window的绝对位置, x为按钮的MaxY位于window的绝对位置>
 *
 *  @param contents 选项操作的集合
 *
 *  @return YYPopMenu
 */
- (instancetype)initWithPosition:(CGPoint)position contents:(NSArray *)contents;

/**
 *  显示弹框
 */
- (void)showPopMenu;

/**
 *  隐藏弹框
 */
- (void)dismissPopMenu;

@end
