//
//  SSBBaseViewController.h
//  InPhoto
//
//  Created by shishi on 2018/8/23.
//  Copyright © 2018年 石世彪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSBBaseViewController : UIViewController<UINavigationBarDelegate>

@property (nonatomic,strong)SSBNavigationBar *navBar; //导航栏

@property (nonatomic,strong)UINavigationItem *navItem;

@property (nonatomic, strong) UIView *bottomBarView;

@property (nonatomic,strong)UIButton *backUpButton; //返回按钮
@property (nonatomic, strong) UIButton *rightButton; //右侧按钮

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *rightMenuNavBtn;//右侧图片按钮

@property(nonatomic, strong)NSMutableArray *noMoveBackArray;


/**
 创建导航栏
 */
- (void)initNavBar;

/**
 右侧返回
 */
- (void)backBtnItemClick;

/**
 左侧按钮添加
 */
- (void)addBackUpBtn;

- (void)addRightBtn;

/**
 添加导航栏的标题

 @param title 标题
 */
- (void)addTitleLabelWithTitle:(NSString *)title;

/**
 设置标题

 @param title 标题
 @param color 颜色
 @param fontSize 字体大小
 */
- (void)setNavBarWithTitle:(NSString *)title titleColor:(UIColor *)color titleFontSize:(CGFloat)fontSize;

/**
 设置标题

 @param string 标题
 */
- (void)setNavBarTitle:(NSString *)string;

/**
 设置左侧按钮

 @param title 按钮描述
 @param backImg 按钮图片
 */
- (void)addLeftBtn:(NSString *)title backImg:(NSString *)backImg;

/**
 设置右侧按钮

 @param title 按钮描述
 @param backImg 按钮图片
 */
- (void)addRightBtn:(NSString *)title backImg:(NSString *)backImg;

/**
 在某些界面需要将其隐藏
 */
- (void)hideNavigationBar;

/**
 右button需要时重写此方法

 @param sender 按钮
 */
- (void)rightBtnClick:(UIButton *)sender;

/**
 设置返回按钮的图片

 @param type 返回按钮的类型
 */
- (void)setBackUpBtnStayle:(SSBNaviBackBtnType)type;

/**
 设置右侧按钮的图片
 
 @param type 返回按钮的类型
 */
- (void)setRightBtnStayle:(SSBNaviRightBtnType)type;

/**
 返回按钮图片
 @param image 图片
 */
- (void)setbackUpBtnImage:(UIImage *)image;

/**
 右侧按钮

 @param image 图片
 */
- (void)setRightButtonWithImage:(UIImage *)image;

/**
 右侧类型按钮
 
 @param image 图片
 */
- (void)setRightBtnImage:(UIImage *)image;

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer;

@end

