//
//  Interface.h
//  InPhoto
//
//  Created by shishi on 2018/8/24.
//  Copyright © 2018年 石世彪. All rights reserved.
//

#ifndef Interface_h
#define Interface_h

/*-------------------获控制器 高度、宽度--------------------*/
#define VW (self.view.frame.size.width)
#define VH (self.view.frame.size.height)
/*-------------------获控制器 高度、宽度--------------------*/

/*-------------------获控控件 高度、宽度--------------------*/
#define KW (self.frame.size.width)
#define KH (self.frame.size.height)

/*-------------------获控控件 高度、宽度--------------------*/

/*-------------------获取屏幕 宽度、高度--------------------*/
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
/*-------------------获取屏幕 宽度、高度--------------------*/

#define MY_SCREEN ([UIScreen mainScreen].bounds)

#define MY_WIDTH (MY_SCREEN.size.width)

#define MY_HEIGHT (MY_SCREEN.size.height)

#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)   //底栏
#define kTopHeight (kStatusBarHeight + kNavBarHeight)    //nav

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

#define COLOR_RGB(rgbValue,a) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00)>>8))/255.0 blue: ((float)((rgbValue) & 0xFF))/255.0 alpha:(a)]

#import "SSBNavigationBar.h"
#import "SSBMediaStatus.h"
#import "SSBBaseNavigationViewController.h"
#import "SSBBaseViewController.h"
#import "UIColor+Extension.h"
#import "UIView+Extension.h"
#import "SSBTabBar.h"
#import "RootViewController.h"
#import "HomeViewController.h"
#import "FindViewController.h"
#import "MineViewController.h"

#endif /* Interface_h */
