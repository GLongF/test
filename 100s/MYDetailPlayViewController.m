//
//  MYDetailPlayViewController.m
//  100s
//
//  Created by 郭龙飞 on 16/7/10.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYDetailPlayViewController.h"
#import "MYDetailPlayView.h"
#import "MYChatController.h"
@interface MYDetailPlayViewController ()
@property (nonatomic,strong) MYDetailPlayView *detailView;
@end

@implementation MYDetailPlayViewController

- (void)loadView {
    self.detailView = [[MYDetailPlayView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.detailView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关注" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarbuttonAction:)];
    
    __weak typeof(self) weakSelf = self;
    self.detailView.messageButtton.block = ^(MYButton *btn) {
        
        MYChatController *chatController = [[MYChatController alloc] init];
        [weakSelf.navigationController pushViewController:chatController animated:YES];
        };
}

// rightBarButtonItem
- (void)rightBarbuttonAction:(UIButton *)sender {
    
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
