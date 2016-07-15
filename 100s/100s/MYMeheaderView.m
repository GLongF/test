//
//  MYMeheaderView.m
//  100s
//
//  Created by 郭龙飞 on 16/7/15.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYMeheaderView.h"

#define PHOTOIMAGE_WIDTH 100

@implementation MYMeheaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupView];
    }
    return self;
}

- (void)setupView {
    // 头像
    self.photoImage = [[UIImageView alloc] initWithFrame:CGRectMake((self.width - PHOTOIMAGE_WIDTH) / 2 ,(self.height - PHOTOIMAGE_WIDTH) / 4, PHOTOIMAGE_WIDTH, PHOTOIMAGE_WIDTH)];
    [self.photoImage setImage:[UIImage imageNamed:@"2-02.png"]];
    [self addSubview:self.photoImage];
    
    // 名字
    self.nameLable = [[UILabel alloc] initWithFrame:CGRectMake(self.photoImage.left - 30,self.photoImage.bottom + 10 , PHOTOIMAGE_WIDTH + 60, 44)];
    self.nameLable.textAlignment = NSTextAlignmentCenter;
    self.nameLable.text = @"懵逼的少女";
    [self addSubview:self.nameLable];
    
    // 间隔线
    self.lable = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bottom - 3, self.width, 3)];
    self.lable.backgroundColor = [UIColor grayColor];
    self.lable.alpha = 0.5;
    [self addSubview:self.lable];
}

@end
