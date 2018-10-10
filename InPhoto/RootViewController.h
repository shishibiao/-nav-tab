//
//  RootViewController.h
//  InPhoto
//
//  Created by shishi on 2018/8/23.
//  Copyright © 2018年 石世彪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : SSBBaseViewController

@property (assign ,nonatomic) NSInteger currentIndex;


- (void)hiddenTabbarView:(BOOL)isHidden;

- (void)showHomeViewController;

- (void)setCurrentViewControllerIndex:(NSInteger)index;

- (void)showRewardViewListPage;
/**
 *  进入应用跳转页面
 */
- (void)jumpToViewControllerWithDict:(NSString *)dataString;

- (void)checkMessageUnreadString:(NSString *)dataString;

@end
