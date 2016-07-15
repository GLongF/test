//
//  MYMeViewController.m
//  100s
//
//  Created by 郭龙飞 on 16/7/10.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYMeViewController.h"
#import "MYMeCell.h"
#import "MYMeheaderView.h"
#import "MYConversationController.h"
#import "MYEditController.h"

@interface MYMeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *tableDataArry;
@end

@implementation MYMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的100s";
    // 左button
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"私信" style:UIBarButtonItemStyleDone target:self action:@selector(leftAction:)];
    // 右button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(rightAction:)];
    
    // 初始化tableView
    [self setupTableView];
    
    // 数据源
    self.tableDataArry = @[@"我的声音",@"意见反馈"].mutableCopy;



}
// 左button
- (void)leftAction:(UIBarButtonItem *)sender {
    MYConversationController *conversation = [[MYConversationController alloc] init];
    conversation.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:conversation animated:YES];
}
// 右button
- (void)rightAction:(UIBarButtonItem *)sender {
    MYEditController *edit = [[MYEditController alloc] init];
    edit.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:edit animated:YES];
}
#pragma mark -- tableView

- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    [self.tableView registerClass:[MYMeCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    
    MYMeheaderView *headerView = [[MYMeheaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT * 0.3)];
    self.tableView.tableHeaderView = headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableDataArry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MYMeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.lable.text = self.tableDataArry[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
