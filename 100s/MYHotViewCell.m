//
//  MYHotViewCell.m
//  100s
//
//  Created by 郭龙飞 on 16/7/13.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYHotViewCell.h"

@interface MYHotViewCell()
/** photoImage */
@property (nonatomic, strong) UIImageView *photoImage;

@end

@implementation MYHotViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpView];
    }
    
    return self;
}


- (void)setUpView{
    UIImageView *photoImage = [[UIImageView alloc] init];
    [photoImage setImage:[UIImage imageNamed:@"voice.png"]];
    [self.contentView addSubview:photoImage];
    self.photoImage = photoImage;
    
    UILabel *voiceDetailLabel = [[UILabel alloc] init];
    [self.contentView addSubview:voiceDetailLabel];
    self.voiceDetailLabel = voiceDetailLabel;
}


-(void)layoutSubviews{
    self.photoImage.frame = CGRectMake(5, 10, 40, 40);
    self.voiceDetailLabel.frame = CGRectMake(CGRectGetMaxX(self.photoImage.frame) + 5, CGRectGetMinY(self.photoImage.frame) + 10, self.contentView.frame.size.width - CGRectGetMaxX(self.photoImage.frame), 20);
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
