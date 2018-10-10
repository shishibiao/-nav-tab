//
//  UIView+Extension.h
//
//  Created by 张磊 on 14-11-14.
//  Copyright (c) 2014年 com.zixue101.www. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic,assign) CGFloat x;
@property (nonatomic, assign, readwrite) CGFloat xMid;
@property (nonatomic, assign, readwrite) CGFloat xMax;
@property (nonatomic,assign) CGFloat y;
@property (nonatomic, assign, readwrite) CGFloat yMid;
@property (nonatomic, assign, readwrite) CGFloat yMax;
@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGSize size;
@property (nonatomic, assign, readwrite) CGPoint origin;

@end
