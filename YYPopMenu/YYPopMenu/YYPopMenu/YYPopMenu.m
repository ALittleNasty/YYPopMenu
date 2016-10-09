//
//  YYPopMenu.m
//  YYPopMenu
//
//  Created by ALittleNasty on 16/10/8.
//  Copyright © 2016年 vcredit. All rights reserved.


#import "YYPopMenu.h"
#import "YYPopMenuCell.h"

#define kAppWindow      [UIApplication sharedApplication].keyWindow
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height
#define kScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kScreenBounds   [UIScreen mainScreen].bounds

static NSString *cellID = @"_YYPopMenuCellIdentifier";

@interface YYPopMenu()<UITableViewDataSource, UITableViewDelegate>

/** 位置 */
@property (nonatomic, assign) CGPoint position;
/** 操作集合 */
@property (nonatomic, strong) NSArray *contents;
/** 背景 */
@property (nonatomic, strong) UIView *darkView;
/** 白色小三角 */
@property (nonatomic, strong) UIImageView *triangleImageView;
/** 选项表格 */
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation YYPopMenu

#pragma mark - Public Methods
/**
 *  初始化
 */
- (instancetype)initWithPosition:(CGPoint)position contents:(NSArray *)contents
{
    self = [super init];
    if (self) {
        
        // 可选择的操作不能小于2个
        NSAssert(contents.count >= 2, @"操作项目不能少于2个");
        
        // 保存传进来的数据
        self.position = position;
        self.contents = contents;
        
        // 初始化子视图
        [self initSubviews];
    }
    return self;
}
/**
 *  显示
 */
- (void)showPopMenu
{
    [_darkView setAlpha:1.f];
    [kAppWindow addSubview:self];
    // 先修改三角形图片和tableView的状态为动画开始原始状态
    _triangleImageView.alpha = .0;
    _tableView.frame = CGRectMake(self.position.x - 80.f, self.position.y + 12.f, 100.f, 0.0);
    [UIView animateWithDuration:0.2 animations:^{
        // 改变
        _triangleImageView.alpha = 1.0;
        _tableView.frame = CGRectMake(self.position.x - 80.f, self.position.y + 12.f, 100.f, self.contents.count * 40.f);
    } completion:NULL];
}
/**
 *  隐藏
 */
- (void)dismissPopMenu
{
    [UIView animateWithDuration:0.2 animations:^{
        _tableView.frame = CGRectMake(self.position.x - 80.f, self.position.y + 12.f, 100.f, 0.f);
    } completion:^(BOOL finished) {
        _triangleImageView.alpha = .0;
        [_darkView setAlpha:0];
        [self removeFromSuperview];
    }];
}

#pragma mark - Private Methods

- (void)initSubviews
{
    _darkView = [[UIView alloc] initWithFrame:kScreenBounds];
    _darkView.backgroundColor = [UIColor clearColor];
    _darkView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissPopMenu)];
    [_darkView addGestureRecognizer:tap];
    [self addSubview:_darkView];
    
    CGFloat position_x = self.position.x - 6; 
    _triangleImageView = [[UIImageView alloc] init];
    _triangleImageView.frame = CGRectMake(position_x, self.position.y, 12.f, 12);
    _triangleImageView.image = [UIImage imageNamed:@"select"];;
    [_darkView addSubview:_triangleImageView];
    
    CGFloat tableHeight = self.contents.count * 40.f;
    CGRect tableFrame = CGRectMake(self.position.x - 80.f, self.position.y + 12.f, 100.f, tableHeight);
    _tableView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.clipsToBounds = YES;
    _tableView.layer.cornerRadius = 4.f;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_darkView addSubview:_tableView];
    [_tableView registerNib:[YYPopMenuCell nib] forCellReuseIdentifier:cellID];
    
    self.frame = [UIScreen mainScreen].bounds;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contents.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYPopMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.mTitleLabel.text = self.contents[indexPath.row];
    if (indexPath.row == self.contents.count - 1) {
        cell.hideBottomLine = YES;
    } else {
        cell.hideBottomLine = NO;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismissPopMenu];
    
    if (self.tapAction) {
        self.tapAction(indexPath.row);
    }
    
    [self tableView:self.tableView didDeselectRowAtIndexPath:indexPath];
}


@end
