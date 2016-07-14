//
//  MYHotCollectionCell.h
//  100s
//
//  Created by 郭龙飞 on 16/7/14.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYHotCollectionCell : UICollectionViewCell
/** 名字 */
@property (nonatomic, strong) UILabel *nameLabel;
/** 头像 */
@property (nonatomic, strong) UIImageView *photoImage;
/** 背景图片 */
@property (nonatomic, strong) UIImageView *coverImage;

@end
