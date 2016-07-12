//
//  MYChatController.m
//  100s
//
//  Created by 郭龙飞 on 16/7/12.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYChatController.h"
#import "MYToolTextView.h"

@interface MYChatController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *chatView;
/** 消息数组 */
@property (nonatomic,strong) NSMutableArray *conversations;
@end

@implementation MYChatController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.conversations = [NSMutableArray new];
    [self setupTableView];
    MYToolTextView *tool = [[MYToolTextView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44)];
    tool.backgroundColor = [UIColor redColor];
    [self.view addSubview:tool];
    
}

- (void)setupTableView {
    self.chatView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.chatView.delegate = self;
    self.chatView.dataSource = self;
    [self.view addSubview:self.chatView];
    
    //self.chatView registerClass:<#(nullable Class)#> forCellReuseIdentifier:<#(nonnull NSString *)#>

}

#pragma mark - tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.conversations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
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
