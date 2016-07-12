//
//  MYDetailPlayView.h
//  100s
//
//  Created by 郭龙飞 on 16/7/11.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYDetailPlayView : UIView
/** 播放背景 */
@property(nonatomic,strong) UIImageView *playerBackImage;
/** 点赞按钮 */
@property(nonatomic,strong) UIButton * praiseButton;
/** 私信按钮 */
@property(nonatomic,strong) UIButton * messageButtton;
/** 礼物按钮 */
@property(nonatomic,strong) UIButton * giftButton;
/** 播放次数 */
@property(nonatomic,strong) UIButton * playTimesButton;
/** 分享次数 */
@property(nonatomic,strong) UIButton * shareTimesbuttton;

@end
