//
//  MYChatController.m
//  100s
//
//  Created by 郭龙飞 on 16/7/12.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYChatController.h"
#import "MYToolTextView.h"
#import "MYChatCell.h"

@interface MYChatController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *chatView;
/** 消息数组 */
@property (nonatomic,strong) NSMutableArray *conversations;
@property (nonatomic,strong) MYToolTextView *toolTextView;
@end

@implementation MYChatController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.conversations = [NSMutableArray new];
    // 1.创建tableView
    [self setupTableView];
    
    // 2.创建自定义控件
 
    MYToolTextView *tool = [[MYToolTextView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44)];
    
    [self.view addSubview:tool];
    
    self.toolTextView = [[MYToolTextView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 40, self.view.frame.size.width, 40)];
    
    // 添加通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrameNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
    UITapGestureRecognizer *tapgest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackAction)];
    [self.view addGestureRecognizer:tapgest];

}

// 通知回调的方法
- (void)keyboardWillChangeFrameNotification:(NSNotification *)noti {
    //[noti.userInfo(UIKeyboardFrameEndUserInfoKey) CGRect]
   CGRect keyboardFrame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    if (keyboardFrame.origin.y < SCREEN_HEIGHT) {
        self.view.frame = CGRectMake(0, - keyboardFrame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT);
    }else {
        self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    
}

- (void)tapBackAction {
    [self.view endEditing:YES];

}

- (void)setupTableView {
    self.chatView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.chatView.delegate = self;
    self.chatView.dataSource = self;
    [self.view addSubview:self.chatView];
}


#pragma mark - tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.conversations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CHATCELL";
    MYChatCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MYChatCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
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
