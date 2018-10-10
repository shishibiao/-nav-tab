//
//  SSBNavigationBar.m
//  InPhoto
//
//  Created by shishi on 2018/8/23.
//  Copyright © 2018年 石世彪. All rights reserved.
//

#import "SSBNavigationBar.h"

@implementation SSBNavigationBar

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //注意导航栏及状态栏高度适配
    self.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), kTopHeight);
    for (UIView *view in self.subviews) {
        if([NSStringFromClass([view class]) containsString:@"Background"]) {
            view.frame = self.bounds;
        }
        else if ([NSStringFromClass([view class]) containsString:@"ContentView"]) {
            CGRect frame = view.frame;
            frame.origin.y = kStatusBarHeight;
            frame.size.height = self.bounds.size.height - frame.origin.y;
            view.frame = frame;
        }
    }
    
//    CGFloat systemVersion = [UIDevice currentDevice].systemVersion.floatValue;
//    for (UIView *view in self.subviews) {
//        if (systemVersion >= 11.0){
//            if ( [view isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
//                [view removeFromSuperview];
//            }
//        }else{
//            if ( [view isKindOfClass:NSClassFromString(@"_UINavigationBarContentView")]) {
//                [view removeFromSuperview];
//            }
//        }
//    }
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
            [view removeFromSuperview];
        }
    }
}

@end
