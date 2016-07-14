//
//  MYHotCollectionCell.m
//  100s
//
//  Created by 郭龙飞 on 16/7/14.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYHotCollectionCell.h"

@implementation MYHotCollectionCell


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

        [self setupView];
    }
    return self;
}

- (void)setupView {
   self.backgroundColor= [UIColor colorWithRed:0.9425 green:0.8752 blue:0.7971 alpha:0.436314655172414];
    // 头像
    _photoImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [_photoImage setImage:[UIImage imageNamed:@"voice.png"]];
    [self addSubview:_photoImage];
    
    // 名字
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake( _photoImage.right +5 ,0, self.frame.size.width - _photoImage.right + 10, 40)];
    _nameLabel.font = [UIFont systemFontOfSize:15];

    [self addSubview:_nameLabel];
    
    // 背景图片
    _coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, _photoImage.bottom + 5, self.frame.size.width, self.frame.size.width )];
    [_coverImage setImage:[UIImage imageNamed:@"voice.png"]];
    [self addSubview:_coverImage];

}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize nameSize = [_nameLabel.text sizeWithAttributes:@{NSFontAttributeName:_nameLabel.font}];
    //_nameLabel.frame = CGRectMake(0, SCREEN_HEIGHT - 20, nameSize.width, 20);
    
}


@end
