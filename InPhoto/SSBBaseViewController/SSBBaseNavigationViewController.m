//
//  SSBBaseNavigationViewController.m
//  InPhoto
//
//  Created by shishi on 2018/8/24.
//  Copyright © 2018年 石世彪. All rights reserved.
//

#import "SSBBaseNavigationViewController.h"

@interface SSBBaseNavigationViewController ()

@end

@implementation SSBBaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor orangeColor] forKey:NSForegroundColorAttributeName]];
    [self.navigationBar setTranslucent:YES];
//    [self.navigationController.navigationBar setBackgroundColor:[UIColor orangeColor]];
    [self.navigationBar setBarStyle:UIBarStyleBlack];
    [self.navigationBar setHidden:YES];
    
    //设置右滑返回手势的代理为自身
    __weak typeof(self) weakself = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = (id)weakself;
    }
    
}


#pragma mark - UIGestureRecognizerDelegate
//这个方法是在手势将要激活前调用：返回YES允许右滑手势的激活，返回NO不允许右滑手势的激活
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        //屏蔽调用rootViewController的滑动返回手势，避免右滑返回手势引起死机问题
        if (self.viewControllers.count < 2 ||
            self.visibleViewController == [self.viewControllers objectAtIndex:0]) {
            return NO;
        }
    }
    //这里就是非右滑手势调用的方法啦，统一允许激活
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
