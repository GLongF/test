//
//  MYDetailPlayView.m
//  100s
//
//  Created by 郭龙飞 on 16/7/11.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYDetailPlayView.h"
#define PLAYERBACK_WIDTH 300
#define PLAYERBACK_HEIGHT 300
#define BUTTON_WIDTH 80
@implementation MYDetailPlayView

- (instancetype)initWithFrame:(CGRect)frame {
   self = [super initWithFrame:frame];
  
    if (self) {
        [self setupView];
    }
    
    return self;
}

- (void)setupView {
    self.playerBackImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"voice.png"]];
    
    self.praiseButton = [MYButton createMYButton];
    [self.praiseButton setTitle:@"赞" forState:UIControlStateNormal];
    [self.praiseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.messageButtton = [MYButton createMYButton];
      [self.messageButtton setTitle:@"私信" forState:UIControlStateNormal];
    [self.messageButtton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
#pragma mark -- 目前版本不需要 没有设置frame
    // 礼物 ()
    self.giftButton = [MYButton createMYButton];
    [self.giftButton setBackgroundImage:[UIImage imageNamed:@"voice.png"] forState:UIControlStateNormal];
    
    self.playTimesButton = [MYButton createMYButton];;
    [self.playTimesButton setTitle:@"播放" forState:UIControlStateNormal];
    [self.playTimesButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    self.shareTimesbuttton = [MYButton createMYButton];
    [self.shareTimesbuttton setTitle:@"转发" forState:UIControlStateNormal];
    [self.shareTimesbuttton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [self addSubview:self.playerBackImage];
    [self addSubview:self.praiseButton];
    [self addSubview:self.messageButtton];
    [self addSubview:self.giftButton];
    [self addSubview:self.playTimesButton];
    [self addSubview:self.shareTimesbuttton];
}

- (void)layoutSubviews {
    self.playerBackImage.frame = CGRectMake((self.width - PLAYERBACK_WIDTH) / 2 , 84, PLAYERBACK_WIDTH, PLAYERBACK_HEIGHT);
    // 赞
    self.praiseButton.frame = CGRectMake(self.left,self.playerBackImage.bottom + 30  , BUTTON_WIDTH, 60);
    // 私信
    self.messageButtton.frame = CGRectMake(self.praiseButton.right + 20, self.praiseButton.top, BUTTON_WIDTH, 60);
    // 播放次数
    self.playTimesButton.frame = CGRectMake(self.messageButtton.right + 20, self.praiseButton.top, BUTTON_WIDTH, 60);
    // 转发次数
    self.shareTimesbuttton.frame = CGRectMake(self.playTimesButton.right + 20, self.praiseButton.top, BUTTON_WIDTH, 60);
    
}
@end
