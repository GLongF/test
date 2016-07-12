//
//  MYDetailPlayView.m
//  100s
//
//  Created by 郭龙飞 on 16/7/11.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYDetailPlayView.h"

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
    self.playerBackImage.frame = CGRectMake(20, 84, self.frame.size.width - 40, self.frame.size.width - 40);
    self.praiseButton.frame = CGRectMake(0,CGRectGetMaxY(self.playerBackImage.frame) + 30  , 60, 60);
    self.messageButtton.frame = CGRectMake(CGRectGetMaxX(self.praiseButton.frame) + 20, CGRectGetMinY(self.praiseButton.frame), 60, 60);
    self.giftButton.frame = CGRectMake(CGRectGetMaxX(self.messageButtton.frame) + 20, CGRectGetMinY(self.praiseButton.frame), 80, 80);
    self.playTimesButton.frame = CGRectMake(CGRectGetMaxX(self.giftButton.frame) + 20, CGRectGetMinY(self.praiseButton.frame), 60, 60);
    self.shareTimesbuttton.frame = CGRectMake(CGRectGetMaxX(self.playTimesButton.frame) + 20, CGRectGetMinY(self.praiseButton.frame), 60, 60);
    
}
@end
