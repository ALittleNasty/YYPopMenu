//
//  ViewController.m
//  YYPopMenu
//
//  Created by ALittleNasty on 16/10/8.
//  Copyright © 2016年 vcredit. All rights reserved.
//

#import "ViewController.h"
#import "YYPopMenu/YYPopMenu.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)mureButtonAction:(UIButton *)sender
{
    CGPoint position = CGPointMake(CGRectGetMidX(sender.frame), CGRectGetMaxY(sender.frame));
    YYPopMenu *menu = [[YYPopMenu alloc] initWithPosition:position contents:@[@"扫一扫", @"摇一摇",@"咻一咻"]];
    menu.tapAction = ^(NSInteger index){
        NSLog(@"选中第%zd项", index + 1);
    };
    [menu showPopMenu];
}

@end
