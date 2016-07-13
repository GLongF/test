//
//  MYMainViewController.m
//  100s
//
//  Created by 郭龙飞 on 16/7/10.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYMainViewController.h"
#import "MYDetailPlayViewController.h"
#import "MYHotViewCell.h"

@interface MYMainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UIScrollView *scrollView;

/** 热门页面 */
@property(nonatomic,strong) UITableView *hotTableView;
/** 热门数据 */
@property(nonatomic,strong) NSMutableArray *hotDataArray;

@end

@implementation MYMainViewController

- (void)loadView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -64, SCREEN_WIDTH * 4, SCREEN_HEIGHT)];
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 4, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    self.view = self.scrollView;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 热门页面
    [self putHotTableView];
    [self putNewView];
}



#pragma mark  - 设置hotTableView 并实现代理方法

- (void)putHotTableView {

    self.hotTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 44) style:UITableViewStylePlain];
    [self.scrollView addSubview:self.hotTableView];
    self.hotTableView.delegate = self;
    self.hotTableView.dataSource = self; 
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

#pragma mark -  - - - -- - -- newView
- (void)putNewView {
   
    
}

#pragma mark -  - - - -- - -- starView



#pragma mark -  - - - -- - -- foucsView




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
