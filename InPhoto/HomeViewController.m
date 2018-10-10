//
//  HomeViewController.m
//  InPhoto
//
//  Created by shishi on 2018/8/28.
//  Copyright © 2018年 石世彪. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self initNavBar];
    [self.navBar setBackgroundColor:[UIColor yellowColor]];//设置nav背景颜色
    
    [self setNavBarWithTitle:@"首页" titleColor:[UIColor redColor] titleFontSize:16.0f];
//    [self hideNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
