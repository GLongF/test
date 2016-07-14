//
//  PCHeader.h
//  100s
//
//  Created by 郭龙飞 on 16/7/11.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#ifndef PCHeader_h
#define PCHeader_h

#import "MYButton.h"
#import "UIView+MYExtension.h"

#define WeakSelf(s) __weak typeof(s) weak##s = s
#define StrongSelf(s) __strong typeof(s) s = weak##s

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


#endif /* PCHeader_h */
