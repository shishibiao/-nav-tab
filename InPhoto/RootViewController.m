//
//  RootViewController.m
//  InPhoto
//
//  Created by shishi on 2018/8/23.
//  Copyright © 2018年 石世彪. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()<SSBTabBarDelegate>

@property(strong, nonatomic) SSBBaseNavigationViewController *HomeController;
@property(strong, nonatomic) SSBBaseNavigationViewController *FindController;
@property(strong, nonatomic) SSBBaseNavigationViewController *MineController;
@property(strong, nonatomic) SSBBaseNavigationViewController *currentViewController;

@end

@implementation RootViewController{
    
    SSBTabBar * tableBar;
    
    UIImageView         *_messageUnRead;
}

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableBar];
    [self initViewController];
    _currentIndex = 0;
}

- (void)initTableBar{
    
    if(tableBar)return;
    NSArray *imgArray = [[NSArray alloc] initWithObjects:
                         @{@"Normal":@"home_normal", @"Selected":@"home_selected"},
                         @{@"Normal":@"find_normal", @"Selected":@"find_selected"},
                         @{@"Normal":@"mine_normal", @"Selected":@"mine_selected"},
                         nil];
    
    CGRect frame = CGRectMake(0, SCREEN_HEIGHT - kTabBarHeight, SCREEN_WIDTH, kTabBarHeight);
    tableBar = [[SSBTabBar alloc] initWithFrame:frame buttonImages:imgArray];
    tableBar.backgroundView.backgroundColor = [UIColor clearColor];
    tableBar.delegate = self;
    
    [self.view addSubview:tableBar];
    _messageUnRead = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 4 / 5 - 28, 2, 10, 10)];
    [_messageUnRead setImage:[UIImage imageNamed:@"icon_list_unread"]];
    [tableBar addSubview:_messageUnRead];
//    [_messageUnRead setHidden:YES];
    [self hiddenTabbarView:NO];
}



- (void)initViewController{
    if(!_FindController){
        [self FindController];
    }
    if(!_HomeController){
        [self HomeController];
    }
    [self.view addSubview:self.HomeController.view];
    _currentViewController = _HomeController;
    
    [tableBar selectTabAtIndex:0];
    [self.view bringSubviewToFront:tableBar];
}

- (void)hiddenTabbarView:(BOOL)isHidden {
    if (isHidden) {
        [UIView animateWithDuration:0.3
                         animations:^{
                             self->tableBar.top = SCREEN_HEIGHT;
                         }];
    } else {
        [UIView animateWithDuration:0.3
                         animations:^{
                             self->tableBar.top = SCREEN_HEIGHT-kTabBarHeight;
                         }];
    }
}

#pragma mark - KSTabBarDelegate
- (void)tabBar:(SSBTabBar *)tabBar didSelectIndex:(NSInteger)index {
    _currentIndex = index;
    
    switch (index) {
        case 0:
        {
            //首页
            if(_currentViewController == _HomeController)return;
            [self transitionFromViewController:_currentViewController toViewController:self.HomeController duration:0 options:UIViewAnimationOptionCurveEaseInOut animations:nil completion:^(BOOL finished) {
                self.currentViewController = self.HomeController;
            }];
        }
            break;
        case 1:
        {
            //发现
            if(_currentViewController == _FindController)return;
            [self transitionFromViewController:_currentViewController toViewController:self.FindController duration:0 options:UIViewAnimationOptionCurveEaseInOut animations:nil completion:^(BOOL finished) {
                self.currentViewController = self.FindController;
            }];
        }
            break;
        case 2:
        {
            //我的
            if(_currentViewController == _MineController)return;
            [self transitionFromViewController:_currentViewController toViewController:self.MineController duration:0 options:UIViewAnimationOptionCurveEaseInOut animations:nil completion:^(BOOL finished) {
                self.currentViewController = self.MineController;
            }];
        }
            break;
        default:
            break;
    }
    [self.view bringSubviewToFront:tabBar];
}

- (void)showHomeViewController {
    [self initTableBar];
    [self initViewController];
    [tableBar selectTabAtIndex:0];
    [self tabBar:tableBar didSelectIndex:0];
    [self.view bringSubviewToFront:tableBar];
}

- (void)setCurrentViewControllerIndex:(NSInteger)index{
    [tableBar selectTabAtIndex:index];
    [self tabBar:tableBar didSelectIndex:index];
}

- (void)showRewardViewListPage{
    [self setCurrentViewControllerIndex:1];
    SSBBaseViewController  *viewController = [self.MineController.viewControllers firstObject];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [viewController setCurrentIndex:1];
    });
}

- (NSInteger)currentIndex{
    return _currentIndex;
}


#pragma getterMethod
- (SSBBaseNavigationViewController *)HomeController{
    if(!_HomeController){
        HomeViewController  *home  = [[HomeViewController alloc] init];
        _HomeController = [[SSBBaseNavigationViewController alloc] initWithRootViewController:home];
        [self addChildViewController:_HomeController];
    }
    return _HomeController;
}

- (SSBBaseNavigationViewController *)FindController{
    if(!_FindController){
        FindViewController  *find = [[FindViewController alloc] init];
        _FindController = [[SSBBaseNavigationViewController alloc] initWithRootViewController:find];
        [self addChildViewController:_FindController];
    }
    return _FindController;
}

- (SSBBaseNavigationViewController *)MineController{
    if(!_MineController){
        MineViewController *mine = [[MineViewController alloc] init];
        _MineController = [[SSBBaseNavigationViewController alloc] initWithRootViewController:mine];
        [self addChildViewController:_MineController];
    }
    return _MineController;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
