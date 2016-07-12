//
//  MYChatController.m
//  100s
//
//  Created by 郭龙飞 on 16/7/12.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYChatController.h"
#import "MYToolTextView.h"

@interface MYChatController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic,strong)UITableView *chatView;
/** 消息数组 */
@property (nonatomic,strong) NSMutableArray *conversations;
@property (nonatomic,strong) MYToolTextView *toolTextView;
@end

@implementation MYChatController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.conversations = [NSMutableArray new];
    [self setupTableView];
    MYToolTextView *tool = [[MYToolTextView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44)];
    tool.backgroundColor = [UIColor redColor];
    [self.view addSubview:tool];
    
    self.toolTextView = [[MYToolTextView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 40, self.view.frame.size.width, 40)];
    
    __weak typeof(self) weakSelf = self;
    
    self.toolTextView.buttonClicked = ^(NSString * draftText){
        
        [weakSelf sendMessageWithDraftText:draftText];
    };

    [self.view addSubview:self.toolTextView];
    self.toolTextView.draftTextField.delegate = self;
    //注册键盘弹出，回收
    [self registerForKeyboardNotifications];
}

// 屏幕撤出时移除通知中心
- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    
    // 移除通知中心
    [self removeForKeyboardNotifications];
    
}


/**
 *  注册通知中心
 */
- (void)registerForKeyboardNotifications
{
    // 使用NSNotificationCenter 注册观察当键盘要出现时
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    // 使用NSNotificationCenter 注册观察当键盘要隐藏时
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

/**
 *  移除通知中心
 */
- (void)removeForKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**
 *  键盘将要弹出
 *
 *  @param notification 通知
 */
- (void)didKeyboardWillShow:(NSNotification *)notification {
    
    NSDictionary * info = [notification userInfo];
    
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    NSLog(@"%f", keyboardSize.height);
    
    //输入框位置动画加载
    [self begainMoveUpAnimation:keyboardSize.height];
}

/**
 *  开始执行键盘改变后对应视图的变化
 *
 *  @param height 键盘的高度
 */
- (void)begainMoveUpAnimation:(CGFloat)height {
    
    [UIView animateWithDuration:0.3 animations:^{
        
        [self.toolTextView setFrame:CGRectMake(0, self.view.frame.size.height - (height + 40), self.toolTextView.frame.size.width, self.toolTextView.frame.size.height)];
    }];
    
}

/**
 *  键盘将要隐藏
 *
 *  @param notification 通知
 */
- (void)didKeyboardWillHide:(NSNotification *)notification {
    
    [self begainMoveUpAnimation:0];
}
// 点击空白处回收键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.toolTextView.draftTextField resignFirstResponder];
}
#pragma  mark -  发送消息
- (void)sendMessageWithDraftText:(NSString *)draftText {
    
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
