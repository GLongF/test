//
//  MYToolTextView.m
//  100s
//
//  Created by 郭龙飞 on 16/7/12.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//
/***
 **                                             输入框
 **
 ***/
#import "MYToolTextView.h"

@interface MYToolTextView ()
/** 语音按钮 */
@property(nonatomic,weak) MYButton *my_voiceBtn;

/**文本输入框 */
@property(nonatomic,weak) UITextView *my_inputView

/** 录音按钮 */;
@property(nonatomic,weak) MYButton *my_sendVoiceBtn;

/** 更多按钮 */
@property(nonatomic,weak) MYButton *my_moreBtn;

@end

@implementation MYToolTextView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        // 1.语音按钮
        MYButton *voiceBtn = [MYButton createMYButton];
        [voiceBtn setImage:[UIImage imageNamed:@"voice.png"] forState:UIControlStateNormal];
        [self addSubview:voiceBtn];
        
        // 2.文本输入框
        UITextView *inputView = [[UITextView alloc] init];
        inputView.backgroundColor = [UIColor whiteColor];
        [self addSubview:inputView];
        
        // 3.录音按钮
        MYButton *sendVoiceBtn = [MYButton createMYButton];
        [sendVoiceBtn setTitle:@"按住说话" forState:UIControlStateNormal];
         [sendVoiceBtn setTitle:@"松开发送" forState:UIControlStateHighlighted];
       
        [self addSubview:sendVoiceBtn];
        sendVoiceBtn.hidden = YES;

        // 4.更多按钮
        MYButton *moreBtn = [MYButton createMYButton];
        [moreBtn setImage:[UIImage imageNamed:@"voice.png"] forState:UIControlStateNormal];
        [self addSubview:moreBtn];
        self.my_voiceBtn = voiceBtn;
        self.my_inputView = inputView;
        self.my_sendVoiceBtn = sendVoiceBtn;
        self.my_moreBtn = moreBtn;
        
        // 事件处理
        voiceBtn.block = ^(MYButton *btn) {
            inputView.hidden = sendVoiceBtn.hidden;
            sendVoiceBtn.hidden  = !inputView.hidden;
        };
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.my_voiceBtn.frame = CGRectMake(2.5,2.5, self.frame.size.height - 5, self.frame.size.height - 5);
    
    self.my_inputView.frame = CGRectMake(CGRectGetMaxX(self.my_voiceBtn.frame) , CGRectGetMinY(self.my_voiceBtn.frame),SCREEN_WIDTH - CGRectGetMaxX(self.my_voiceBtn.frame) * 2 , CGRectGetHeight(self.my_voiceBtn.frame));
    
    self.my_sendVoiceBtn.frame = self.my_inputView.frame;
    
    self.my_moreBtn.frame = CGRectMake(CGRectGetMaxX(self.my_inputView.frame) + 2.5,  CGRectGetMinY(self.my_voiceBtn.frame), CGRectGetWidth(self.my_voiceBtn.frame), CGRectGetHeight( self.my_voiceBtn.frame));
}



@end
