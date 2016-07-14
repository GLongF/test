//
//  MYHotController.m
//  100s
//
//  Created by 郭龙飞 on 16/7/14.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYHotController.h"
#import "MYDetailPlayViewController.h"
#import "MYHotViewCell.h"

@interface MYHotController ()<UITableViewDelegate,UITableViewDataSource>
/** 热门页面 */
@property(nonatomic,strong) UITableView *hotTableView;
/** 热门数据 */
@property(nonatomic,strong) NSMutableArray *hotDataArray;


@end

@implementation MYHotController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 热门页面
    [self putHotTableView];

}

#pragma mark  - 设置hotTableView 并实现代理方法

- (void)putHotTableView {
    
    self.hotTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 44) style:UITableViewStylePlain];
    self.hotTableView.delegate = self;
    self.hotTableView.dataSource = self;
    [self.view addSubview:self.hotTableView];
    [self.hotTableView registerClass:[MYHotViewCell class] forCellReuseIdentifier:@"hotTableViewCell"];
    
    // 初始化数据源
    self.hotDataArray = @[@"你好",@"我好",@"大家好"].mutableCopy;
}

// cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.hotDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MYHotViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hotTableViewCell" forIndexPath:indexPath];
    cell.voiceDetailLabel.text = self.hotDataArray[indexPath.row];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MYDetailPlayViewController *detailPlayVC = [[MYDetailPlayViewController alloc] init];
    [detailPlayVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:detailPlayVC animated:YES];
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
