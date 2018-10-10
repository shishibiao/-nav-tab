//
//  SSBBaseViewController.m
//  InPhoto
//
//  Created by shishi on 2018/8/23.
//  Copyright © 2018年 石世彪. All rights reserved.
//

#import "SSBBaseViewController.h"
#import "AppDelegate.h"

const NSInteger navRightButtonTag = 2000;

@interface SSBBaseViewController ()<UIGestureRecognizerDelegate>{
    UIView      * _lineView;
    UIButton    * _leftButton;
}

@end

@implementation SSBBaseViewController

- (id)init{
    self = [super init];
    if (self) {
        _noMoveBackArray = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor orangeColor]];
    [self.view setClipsToBounds:YES];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //开启iOS7及以上的滑动返回效果
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
}



- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return [self gestureRecognizerShouldBegin];;
}

- (BOOL)gestureRecognizerShouldBegin {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initNavBar{
    if (!_navBar) {
        _navBar = [[SSBNavigationBar alloc] init];
        _navItem = [[UINavigationItem alloc] init];
        
        [_navBar setFrame:CGRectMake(0,0 , SCREEN_WIDTH, kTopHeight)];
        [_navBar setTranslucent:NO];
        [_navBar setBarStyle:UIBarStyleBlackTranslucent];
        [_navBar pushNavigationItem:_navItem animated:NO];
        [_navBar setBarTintColor:[UIColor whiteColor]];
        [_navBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont fontWithName:@"Arial Rounded MT Bold" size:17],NSFontAttributeName, nil]];
        [self.view addSubview:_navBar];
        [_navBar setBackgroundColor:RGB(244, 245, 247)];
    }
}

//隐藏nav
- (void)hideNavigationBar {
    _navBar.hidden = YES;
}

- (void)setNavBarWithTitle:(NSString *)title titleColor:(UIColor *)color titleFontSize:(CGFloat)fontSize {
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [titleLabel setTextColor:color];
    [titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    [titleLabel setText:title];
    [titleLabel sizeToFit];
    _navItem.titleView = titleLabel;
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    [self setNavBarTitle:title];
}

- (void)setNavBarTitle:(NSString *)string {
    _navItem.title = string;
}

- (RootViewController *)getRootViewController {
    return [(AppDelegate*)[[UIApplication sharedApplication] delegate] rootViewController];
}

- (UINavigationController *)getRootNavgationController {
    return [[self getRootViewController] navigationController];
}

- (void)addBackUpBtn {
    if (!_backUpButton) {
        _backUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backUpButton.frame = CGRectMake(8, 0, 48, 48);
        [_backUpButton setBackgroundColor:[UIColor clearColor]];
        _backUpButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [_backUpButton addTarget:self action:@selector(backBtnItemClick) forControlEvents:UIControlEventTouchUpInside];
        [_backUpButton setYMid:(kTopHeight + kStatusBarHeight) / 2];
    }
    [_navBar addSubview:_backUpButton];
}

- (void)addRightBtn {
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.frame = CGRectMake(MY_WIDTH - 48, 0, 48, 48);
        [_rightButton setBackgroundColor:[UIColor clearColor]];
        _rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [_rightButton addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_rightButton setYMid:(kTopHeight + kStatusBarHeight) / 2];
    }
    [_navBar addSubview:_rightButton];
}

- (void)setBackUpBtnStayle:(SSBNaviBackBtnType)type{
    switch (type) {
        case SSBNaviBackBtnRedStayle:
        {
            [self setbackUpBtnImage:[UIImage imageNamed:@"back_red"]];
        }
            break;
        case SSBNaviBackBtnWhiteStayle:
        {
            [self setbackUpBtnImage:[UIImage imageNamed:@"back_white"]];
        }
            break;
        case SSBNaviBackBtnBlackStayle:
        {
            [self setbackUpBtnImage:[UIImage imageNamed:@"back_white"]];
        }
            break;
        case SSBNaviBackBtnDefault:
        {
            [self setbackUpBtnImage:[UIImage imageNamed:@"back_white"]];
        }
            
        default:
            break;
    }
}

- (void)setRightBtnStayle:(SSBNaviRightBtnType)type{
    switch (type) {
        case SSBNaviRightBtnRedStayle:
        {
            [self setRightBtnImage:[UIImage imageNamed:@"right_more"]];
        }
            break;
        case SSBNaviRightBtnWhiteStayle:
        {
            [self setRightBtnImage:[UIImage imageNamed:@"right_more"]];
        }
            break;
        case SSBNaviRightBtnBlackStayle:
        {
            [self setRightBtnImage:[UIImage imageNamed:@"right_icon"]];
        }
            break;
        case SSBNaviRightBtnDefault:
        {
            [self setRightBtnImage:[UIImage imageNamed:@"right_icon"]];
        }
            
        default:
            break;
    }
}

- (void)setbackUpBtnImage:(UIImage *)image {
    if(!_backUpButton){
        [self addBackUpBtn];
    }
    [_backUpButton setImage:image forState:UIControlStateNormal];
}

- (void)setRightBtnImage:(UIImage *)image{
    if(!_rightButton){
        [self addRightBtn];
    }
    [_rightButton setImage:image forState:UIControlStateNormal];
}

- (void)setRightButtonWithImage:(UIImage *)image {
    if (!_rightButton) {
        return;
    }
    UIButton * rightButton = (UIButton *)_navItem.rightBarButtonItem.customView;
    if (rightButton) {
        [rightButton setImage:image forState:UIControlStateNormal];
    }
}

- (void)addTitleLabelWithTitle:(NSString *)title {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(0, 0, 300, 44);
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.text = title;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    _navItem.titleView = _titleLabel;
}

- (void)removeBottomView {
    if (_bottomBarView) {
        [_bottomBarView removeFromSuperview];
    }
}

- (void)addLeftBtn:(NSString *)title backImg:(NSString *)backImg {
    _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    UIImage *image = [UIImage imageNamed:backImg];
    if (image) {
        [_leftButton setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    }
    [_leftButton setImage:image forState:UIControlStateNormal];
    [_leftButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [_leftButton addTarget:self action:@selector(backBtnItemClick) forControlEvents:UIControlEventTouchUpInside];
    [_leftButton setTitle:title forState:UIControlStateNormal];
    [_leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *backBtnItem = [[UIBarButtonItem alloc] initWithCustomView:_leftButton];
    _navItem.leftBarButtonItem = backBtnItem;
}

- (void)addRightBtn:(NSString *)title backImg:(NSString *)backImg {
    _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
    _rightButton.tag = navRightButtonTag;
    if (backImg && [backImg length] > 0) {
        UIImage *image = [UIImage imageNamed:backImg];
        if (image) {
            [_rightButton setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
            [_rightButton setBackgroundImage:[UIImage imageNamed:backImg] forState:UIControlStateNormal];
        }
    } else if (title.length>0) {
        _rightButton.width = title.length*17;
    }
    
    [_rightButton addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_rightButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [_rightButton setTitle:title forState:UIControlStateNormal];
    [_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *backBtnItem = [[UIBarButtonItem alloc] initWithCustomView:_rightButton];
    _navItem.rightBarButtonItem = backBtnItem;
}

- (void)rightBtnClick:(UIButton *)sender {
}

- (void)backBtnItemClick {
    id backViewController = [self.navigationController popViewControllerAnimated:YES];
    if (!backViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)rightButtonTitleWithColor:(UIColor *)color {
    [_rightButton setTitleColor:color forState:UIControlStateNormal];
}

- (void)leftButtonTitleWithColor:(UIColor *)color {
    [_leftButton setTitleColor:color forState:UIControlStateNormal];
}

@end
