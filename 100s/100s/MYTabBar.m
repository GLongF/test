//
//  MYTabBar.m
//  100s
//
//  Created by 郭龙飞 on 16/7/10.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYTabBar.h"

@interface MYTabBar()
/** 声音按钮 */
@property (nonatomic, weak) UIButton *voiceButton;
@end


@implementation MYTabBar


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIButton *voiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        // 未选中
        [voiceButton setBackgroundImage:[UIImage imageNamed:@"voice"] forState:UIControlStateNormal];
        // 选中
        //[voiceButton setBackgroundImage:[UIImage imageNamed:nil] forState:UIControlStateHighlighted];
        [self addSubview:voiceButton];
        self.voiceButton = voiceButton;
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置发布按钮的frame
    self.voiceButton.bounds = CGRectMake(0, 0, 80,80);
    self.voiceButton.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.15);
    
    // 设置其他UITabBarButton的frame
    CGFloat buttonY = 0;
    CGFloat buttonW = self.frame.size.width / 3;
    
    CGFloat buttonH = self.frame.size.height;
    NSInteger index = 0;
    for (UIView *button in self.subviews) {
        //        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        if (![button isKindOfClass:[UIControl class]] || button == self.voiceButton) continue;
        
        // 计算按钮的x值
        CGFloat buttonX = buttonW * index;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 增加索引
        index++;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
