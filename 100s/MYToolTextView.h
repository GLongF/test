//
//  MYToolTextView.h
//  100s
//
//  Created by 郭龙飞 on 16/7/12.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^ButtonClicked)(NSString * draftText);
@interface MYToolTextView : UIView

@property (nonatomic,copy) ButtonClicked buttonClicked;

@end
