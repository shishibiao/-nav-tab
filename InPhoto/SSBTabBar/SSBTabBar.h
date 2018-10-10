//
//  SSBTabBar.h
//  InPhoto
//
//  Created by shishi on 2018/8/28.
//  Copyright © 2018年 石世彪. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SSBTabBarDelegate;

@interface SSBTabBar : UIView

@property (nonatomic, strong) UIImageView *backgroundView;

@property (nonatomic, assign) id<SSBTabBarDelegate>delegate;

@property (nonatomic, strong) NSMutableArray *buttons;


/**
 tabbar

 @param frame fram
 @param imageArray 图片数组
 @return self
 */
- (id)initWithFrame:(CGRect)frame buttonImages:(NSArray *)imageArray;

- (void)selectTabAtIndex:(NSInteger)index;

- (void)selectTabAtIndex:(NSInteger)index animated:(BOOL)animated;

// 设置对应的buttonItem是否接受点击事件
- (void)enableButtonItemAtIndex:(NSInteger)index;

@end

@protocol SSBTabBarDelegate<NSObject>
@optional
- (void)tabBar:(SSBTabBar *)tabBar didSelectIndex:(NSInteger)index;
@end
