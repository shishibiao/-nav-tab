//
//  AppDelegate.h
//  InPhoto
//
//  Created by shishi on 2018/8/23.
//  Copyright © 2018年 石世彪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

+ (AppDelegate *)shareDelegate;

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong, readonly) RootViewController *rootViewController;

@end

